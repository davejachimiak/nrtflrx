module Nrtflrx
  class OAuthLoginRequest
    attr_reader :email, :password, :resource_path, :sub_domain, :params_source,
                :request_token

    def initialize email, password, request_token
      @email         = email
      @password      = password
      @request_token = request_token
      @resource_path = '/oauth/login'
      @sub_domain    = 'api-user'
      @params_source = -> { Nrtflrx::OAuthLoginRequest::Params.new }
    end

    def submit
      http.request(request).body
    end

    def http
    end

    def params
      params_source.call.as_hash.merge({name: email, password: password})
    end
  end
end
