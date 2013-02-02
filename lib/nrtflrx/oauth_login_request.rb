module Nrtflrx
  class OAuthLoginRequest
    attr_reader :email, :password

    def initialize email, password
      @email    = email
      @password = password
    end
  end
end
