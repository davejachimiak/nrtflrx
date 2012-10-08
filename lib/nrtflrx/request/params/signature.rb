module Nrtflrx
  class Request
    class Params
      class Signature
        def initialize(request, params)
          @request = request
          @params  = params
        end

        def sign
        end
      end
    end
  end
end
