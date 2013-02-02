module Nrtflrx
  class OAuthLoginRequest
    attr_reader :email

    def initialize email
      @email = email
    end
  end
end
