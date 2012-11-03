module Nrtflrx
  class Request
    attr_reader :resource_path, :sub_domain

    def initialize(resource_path, sub_domain='api-public')
      @resource_path = resource_path
      @sub_domain    = sub_domain
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
      "http://#{sub_domain}.netflix.com/#{resource_path}"
    end

    def params
      request_params = Nrtflrx::Request::Params.new(base_path)

      request_params.add_signature

      request_params.as_hash
    end
  end
end
