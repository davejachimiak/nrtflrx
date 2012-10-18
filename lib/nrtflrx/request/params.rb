require_relative '../../nrtflrx'
require_relative '../../nrtflrx/request/params/signature'

module Nrtflrx
  class Request
    class Params
      NONCE_UPPER_LIMIT      = 1000000000
      OAUTH_SIGNATURE_METHOD = 'HMAC-SHA1'
      OAUTH_VERSION          = '1.0'

      def initialize(base_path)
        @base_path = base_path
      end

      def as_hash
        params_methods = public_methods(false)
        param_types    = params_methods.reject { |method| method == __method__ }

        Hash[param_types_with_values(param_types)]
      end

      def oauth_consumer_key
        @oauth_consumer_key = Nrtflrx.consumer_key
      end

      def oauth_nonce
        @oauth_nonce ||= rand(NONCE_UPPER_LIMIT)
      end

      def oauth_signature_method
        @oauth_signature_method = OAUTH_SIGNATURE_METHOD
      end

      def oauth_timestamp
        @oauth_timestamp ||= Time.now.utc.to_i.to_s
      end

      def oauth_version
        @oauth_version = OAUTH_VERSION
      end

      def oauth_signature
        hash_for_signature = Hash[params_with_values_for_signature]
        signature          = Nrtflrx::Request::Params::Signature.new(@base_path, hash_for_signature)

        signature.sign
      end

      private

      def param_types_with_values(param_types)
        param_types.map do |param_type|
          [param_type, param_value(param_type)]
        end
      end

      def param_value(param_type)
        send(param_type)
      end

      def params_with_values_for_signature
        ivars_sans_base_path.map do |ivar|
          [sanitize_ivar(ivar), instance_variable_get(ivar)]
        end
      end

      def ivars_sans_base_path
        instance_variables.reject do |ivar|
          ivar == :@base_path
        end
      end

      def sanitize_ivar(ivar)
        ivar.to_s.gsub('@', '').to_sym
      end
    end
  end
end
