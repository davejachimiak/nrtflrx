module Nrtflrx
  class OAuthLoginRequest
    class Params
      def initialize email, password, request_token
        @name               = email
        @password           = password
        @oauth_token        = request_token.oauth_token
        @application_name   = request_token.application_name
        @accept_tos         = true
        @oauth_consumer_key = Nrtflrx.consumer_key
      end

      def as_hash
        param_names_with_values
      end

      private

      def param_names_with_values
        name_value_pairs = param_names.map do |ivar|
          [sanitize_ivar(ivar), instance_variable_get(ivar)]
        end

        Hash[name_value_pairs]
      end

      def param_names
        instance_variables
      end

      def sanitize_ivar ivar
        ivar.to_s.gsub('@', '').to_sym
      end
    end
  end
end
