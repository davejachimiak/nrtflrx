module Nrtflrx
  class UserAuthenticators
    def initialize(login_info)
      @name     = login_info[:name]
      @password = login_info[:password]

      get_request_token
      set_authenticators
    end

    def get_request_token
      request_token_request = Nrtflrx::Request.new('oauth/request_token')
      @request_token        = request_token_request.execute
    end

    def set_authenticators
    end
  end
end
