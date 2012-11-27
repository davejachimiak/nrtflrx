module Nrtflrx
  class Request
    BAD_CONSUMER_KEY_RESPONSE = '<h1>403 Developer Inactive</h1>'

    attr_reader :resource_path, :sub_domain, :params_source

    def initialize resource_path, sub_domain='api-public'
      @resource_path = resource_path
      @sub_domain    = sub_domain
    end

    def send
      response = get_response uri
      raise BadConsumerKeyError if response.body == BAD_CONSUMER_KEY_RESPONSE
      if response.class == Net::HTTPTemporaryRedirect
        redirect_response_body response
      elsif response.class == Net::HTTPOK
        response.body
      else
        raise BadRequestError
      end
    end

    def redirect_response_body response
      get_response(URI response['location']).body
    end

    def uri
      request_uri       = URI "#{base_path}"
      request_uri.query = URI.encode_www_form params
      request_uri
    end

    def base_path
      "http://#{sub_domain}.netflix.com/#{resource_path}"
    end

    def params
      request_params = params_source base_path
      request_params.add_signature
      request_params.as_hash
    end

    private

    def params_source base_path
      @params_source ||= Nrtflrx::Request::Params.send :new, base_path
    end

    def get_response uri
      Net::HTTP.get_response uri
    end
  end
end
