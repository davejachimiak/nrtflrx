require 'net/http'
require_relative 'request/params'

module Nrtflrx
  class Request
    BASE_URL = 'http://api-public.netflix.com'

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

    def base_url
      BASE_URL
    end

    def params
      request_params = Nrtflrx::Request::Params.new

      request_params.as_hash
    end
  end
end
