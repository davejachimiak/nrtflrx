module Nrtflrx
  class OAuthLoginRequest
    attr_reader :email, :password, :resource_path, :sub_domain, :params_source,
                :oauth_token, :http_source

    def initialize email, password, oauth_token
      @email         = email
      @password      = password
      @oauth_token   = oauth_token
      @resource_path = '/oauth/login'
      @sub_domain    = 'api-user'
      @http_source   = lambda { |host, port| Net::HTTP.new host, port }
      @params_source = Nrtflrx::OAuthLoginRequest::Params.new
    end

    def submit
      http.request(request).body
    end

    def http
      request_http             = http_source.(host, 443)
      request_http.use_ssl     = true
      request_http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request_http
    end

    def request
      request_method_object = Net::HTTP::Post.new resource_path
      request_method_object.set_form_data params
      request_method_object
    end

    def params
      params_source.as_hash.merge subscriber_auth_params
    end

    private

    def host
      "#{sub_domain}.netflix.com"
    end

    def subscriber_auth_params
      { name: email, password: password, oauth_token: oauth_token }
    end
  end
end
