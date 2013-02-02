module Nrtflrx
  class SubscriberAuthenticator
    attr_reader :request

    def initialize email, password, oauth_token
      @request = Nrtflrx::OAuthLoginRequest.new email, password, oauth_token
    end

    def authenticate
      response = submit_request
      success? response
    end

    def submit_request
      request.submit
    end

    def success? response
    end
  end
end
