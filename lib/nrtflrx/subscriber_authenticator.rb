module Nrtflrx
  class SubscriberAuthenticator
    attr_reader   :email, :password

    def initialize email, password
      @email    = email
      @password = password
    end

    def authenticate
      true
    end
  end
end
