module Nrtflrx
  class SubscriberAuthenticator
    attr_reader :request

    def initialize email, password
      @request = Nrtflrx::OAuthLoginRequest.new email, password
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
