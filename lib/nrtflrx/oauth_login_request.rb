module Nrtflrx
  class OAuthLoginRequest
    attr_reader :email, :password, :resource_path, :sub_domain, :params_source,
                :oauth_token

    def initialize email, password, oauth_token
      @email         = email
      @password      = password
      @oauth_token   = oauth_token
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
      params_source.call.as_hash.merge subscriber_auth_params
    end

    private

    def subscriber_auth_params
      { name: email, password: password, oauth_token: oauth_token }
    end
  end
end
