require 'net/http'

module Nrtflrx
  class Request
    attr_reader :resource_path

    def initialize(resource_path)
      @resource_path = resource_path
    end

    def execute
      Net::HTTP.get_response(uri)
    end
  end
end
