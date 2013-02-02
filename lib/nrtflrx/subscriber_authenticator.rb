module Nrtflrx
  class SubscriberAuthenticator
    attr_reader   :email, :password, :request

    def initialize email, password
      @email    = email
      @password = password
      @request  = Nrtflrx::Request.new 'oauth/login', 'api-user'
    end

    def authenticate
      response = submit_request
      success? response
    end
  end
end
