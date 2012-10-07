require_relative '../../nrtflrx'

module Nrtflrx
  class Request
    class Params
      NONCE_UPPER_LIMIT      = 1000000000
      OAUTH_SIGNATURE_METHOD = 'HMAC-SHA1'
      OAUTH_VERSION          = '1.0'

      def as_hash
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
        OAUTH_SIGNATURE_METHOD
      end

      def oauth_timestamp
        Time.now.utc.to_i.to_s
      end

      def oauth_version
        OAUTH_VERSION
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
