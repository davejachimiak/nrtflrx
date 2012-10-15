require 'cgi'
require 'base64'

module Nrtflrx
  class Request
    class Params
      class Signature
        attr_reader :base_path, :params

        def initialize(base_path, params)
          @base_path = base_path
          @params    = params
        end

        def sign
          percent_encode(chomped_encoded_signature)
        end

        def base_string
          "GET&#{percent_encode(base_path)}&#{percent_encode(params_string)}"
        end

      private
        def chomped_encoded_signature
          sha1               = OpenSSL::Digest::SHA1.new
          oauth_consumer_key = params[:oauth_consumer_key]
          raw_signature      = OpenSSL::HMAC.digest(sha1, oauth_consumer_key, base_string)
          encoded_signature  = Base64.encode64(raw_signature)

          encoded_signature.chomp
        end

        def params_string
          params.map { |type, value| "#{type.to_s}=#{value}" }.join('&')
        end

        def percent_encode(string)
          CGI.escape(string)
        end
      end
    end
  end
end
