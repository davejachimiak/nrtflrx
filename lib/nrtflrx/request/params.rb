module Nrtflrx
  class Request
    class Params
      def get
        method_names = self.public_methods(false).select do |methods|
          methods != __method__
        end

        Hash[method_names.map do |method_name|
          [method_name, self.send(method_name)]
        end]
      end
    end
  end
end
