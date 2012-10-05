module Nrtflrx
  class Request
    attr_reader :resource_path

    def initialize(resource_path)
      @resource_path = resource_path
    end

    def execute
    end
  end
end
