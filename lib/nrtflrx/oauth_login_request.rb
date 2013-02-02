module Nrtflrx
  class OAuthLoginRequest
    attr_reader :email, :password, :resource_path, :sub_domain, :params_source

    def initialize email, password
      @email         = email
      @password      = password
      @resource_path = '/oauth/login'
      @sub_domain    = 'api-user'
      @params_source = lambda do
        Nrtflrx::OAuthLoginRequest::Params.new
      end
    end

    def params
      params_source.call.as_hash.merge({name: email, password: password})
    end
  end
end
