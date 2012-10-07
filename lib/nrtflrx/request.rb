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

    def uri
      request_uri       = URI("#{base_url}/#{resource_path}")
      request_uri.query = URI.encode_www_form(params)

      request_uri
    end
  end
end
