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

      def add_signature
        @oauth_signature = oauth_signature
      end

      def as_hash
        param_names_with_values
      end

      def oauth_signature
        oauth_signature_source(@base_path, param_names_with_values).sign
      end

      private

      def oauth_signature_source(path, params)
        @oauth_signature_source ||= Nrtflrx::Request::Params::OAuthSignature.
          send(:new, path, params)
      end

      def param_names_with_values
        name_value_pairs = param_names.map do |ivar|
          [sanitize_ivar(ivar), instance_variable_get(ivar)]
        end

        Hash[name_value_pairs]
      end

      def param_names
        instance_variables.reject do |ivar|
          ivar == :@base_path ||
            ivar == :@oauth_signature_source
        end
      end

      def sanitize_ivar(ivar)
        ivar.to_s.gsub('@', '').to_sym
      end
    end
  end
end
