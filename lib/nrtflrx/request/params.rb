require_relative '../../nrtflrx'

module Nrtflrx
  class Request
    class Params
      NONCE_UPPER_LIMIT = 1000000000
      SIGNATURE_METHOD  = 'HMAC-SHA1'

      def get
        params_methods = self.public_methods false
        param_names    = params_methods.reject { |method| method == __method__ }

        Hash[params_with_values(param_names)]
      end

      def oauth_consumer_key
        Nrtflrx.consumer_key
      end

      def oauth_nonce
        rand(NONCE_UPPER_LIMIT)
      end

      def oauth_signature_method
        SIGNATURE_METHOD
      end

    private
      def params_with_values(param_names)
        param_names.map do |param_name|
          [param_name, param_value(param_name)]
        end
      end

      def param_value(param_name)
        self.send(param_name)
      end
    end
  end
end
