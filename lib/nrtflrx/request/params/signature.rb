require 'cgi'
require 'base64'

module Nrtflrx
  class Request
    class Params
      class Signature
        attr_reader :request, :params

        def initialize(request, params)
          @request = request
          @params  = params
        end

        def sign
          sha1               = OpenSSL::Digest::SHA1.new
          oauth_consumer_key = params.oauth_consumer_key

          raw_signature             = OpenSSL::HMAC.digest(sha1, oauth_consumer_key, base_string)
          encoded_signature         = Base64.encode64(raw_signature)
          chomped_encoded_signature = encoded_signature.chomp

          CGI.escape(chomped_encoded_signature)
        end

        def base_string
          "GET&#{CGI.escape(request.base_url)}"
        end
      end
    end
  end
end
