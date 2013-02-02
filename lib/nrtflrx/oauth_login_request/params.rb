module Nrtflrx
  class OAuthLoginRequest
    class Params
      def initialize email, password, request_token
        @name               = email
        @password           = password
        @oauth_token        = request_token.oauth_token
        @application_name   = request_token.application_name
        @accept_tos         = true
        @oauth_consumer_key = Nrtflrx.consumer_key
      end
    end
  end
end
