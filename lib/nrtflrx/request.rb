module Nrtflrx
  class Request
    BASE_URL = 'http://api-public.netflix.com'

    attr_reader :resource_path

    def initialize(resource_path)
      @resource_path = resource_path
    end

    def execute
      Net::HTTP.get(uri)
    end

    def uri
      request_uri       = URI("#{base_path}")
      request_uri.query = URI.encode_www_form(params)

      request_uri
    end

    def base_path
      "#{BASE_URL}/#{resource_path}"
    end

    def params
      request_params = Nrtflrx::Request::Params.new(base_path)

      request_params.add_signature
      request_params.as_hash
    end
  end
end
