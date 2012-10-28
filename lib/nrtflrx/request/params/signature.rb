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
          sha               = OpenSSL::Digest::SHA1.new
          shared_secret     = "#{Nrtflrx.shared_secret}&"
          raw_signature     = OpenSSL::HMAC.digest(sha, shared_secret, base_string)
          encoded_signature = Base64.encode64(raw_signature)

          encoded_signature.chomp
        end

        def base_string
          encoded_base_path     = percent_encode(base_path)
          encoded_params_string = percent_encode(params_string)

          "GET&#{encoded_base_path}&#{encoded_params_string}"
        end

        private

        def params_string
          ordered_params = params.sort

          ordered_params.map { |type, value| "#{type.to_s}=#{value}" }.join('&')
        end

        def percent_encode(string)
          CGI.escape(string)
        end
      end
    end
  end
end
