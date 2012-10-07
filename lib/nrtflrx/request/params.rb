require_relative '../../nrtflrx'

module Nrtflrx
  class Request
    class Params
      def get
        params_methods = self.public_methods false
        param_names    = params_methods.reject { |method| method == __method__ }

        Hash[params_with_values(param_names)]
      end

      def oauth_consumer_key
        Nrtflrx.consumer_key
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
