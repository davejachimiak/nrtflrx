module Nrtflrx
  class UserAuthenticators
    def initialize(login_info)
      @name     = login_info[:name]
      @password = login_info[:password]
    end

    def get_request_token
      @request_token = Nrtflrx::Request.new('oauth/request_token').send
    end

    def set_authenticators
    end
  end
end
