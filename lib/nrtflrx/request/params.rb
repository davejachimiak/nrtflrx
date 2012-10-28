require_relative '../../nrtflrx'
require_relative '../../nrtflrx/request/params/signature'

module Nrtflrx
  class Request
    class Params
      NONCE_UPPER_LIMIT      = 1000000000
      OAUTH_SIGNATURE_METHOD = 'HMAC-SHA1'
      OAUTH_VERSION          = '1.0'

      def initialize(base_path)
        @base_path              = base_path
        @oauth_consumer_key     = Nrtflrx.consumer_key
        @oauth_nonce            = rand(NONCE_UPPER_LIMIT)
        @oauth_signature_method = OAUTH_SIGNATURE_METHOD
        @oauth_timestamp        = Time.now.to_i
        @oauth_version          = OAUTH_VERSION
      end

      def as_hash
        as_hash_sans_signature.merge!({oauth_signature: oauth_signature})
      end

      def oauth_signature
        signature = Nrtflrx::Request::Params::Signature.
          new(@base_path, as_hash_sans_signature)

        signature.sign
      end

      private

      def as_hash_sans_signature
        Hash[params_with_values_for_signature]
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
