module Nrtflrx
  class Queue
    attr_reader :login_credentials

    def initialize(login_credentials)
      @login_credentials = login_credentials

      set_subscriber_tokens
    end

    def add(title_id)
    end

    def titles
    end

    def set_subscriber_tokens
      subscriber = Nrtflrx::Queue::Subscriber.new(login_credentials)

      subscriber.set_request_token

      @subscriber_tokens = subscriber.tokens
    end
  end
end
