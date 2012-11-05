module Nrtflrx
  class Queue
    class Subscriber
      def initialize(login_credentials)
        @login_credentials = login_credentials
      end

      def set_request_token
        @request_token = Nrtflrx.request_token
      end

      def tokens
      end
    end
  end
end
