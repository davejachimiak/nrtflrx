require_relative '../spec_helper'
require_relative '../../lib/nrtflrx'

describe Nrtflrx::OAuthLoginRequest do
  before do
    @email               = 'email'
    @password            = 'password'
    @oauth_token         = 'oauth token'
    @oauth_login_request = Nrtflrx::OAuthLoginRequest.
      new @email, @password, @oauth_token
  end

  describe 'initialize' do
    it 'sets the email passed in' do
      @oauth_login_request.email.must_equal @email
    end

    it 'sets the password passed in' do
      @oauth_login_request.password.must_equal @password
    end

    it 'sets the oauth token passed in' do
      @oauth_login_request.oauth_token.must_equal @oauth_token
    end

    it 'sets the resource path' do
      @oauth_login_request.resource_path.must_equal '/oauth/login'
    end

    it 'sets the sub domain' do
      @oauth_login_request.sub_domain.must_equal 'api-user'
    end
  end

  describe '#submit' do
    it 'returns the response body' do
      response = OpenStruct.new(body: response_body = 'response_body')
      @oauth_login_request.stubs(:http).returns OpenStruct.new(request: nil)
      @oauth_login_request.stubs(:request).returns request = 'request'
      @oauth_login_request.http.stubs(:request).with(request).returns response

      @oauth_login_request.submit.must_equal response_body
    end
  end

  describe '#http' do
    it "is a new http object based on the request host and https port" do
      @oauth_login_request.http.address.must_equal 'api-user.netflix.com'
      @oauth_login_request.http.port.must_equal 443
    end

    it 'sets use ssl to true' do
      Net::HTTP.any_instance.expects(:use_ssl=).with true

      @oauth_login_request.http
    end

    it 'sets the verify mode to verify none' do
      Net::HTTP.any_instance.expects(:verify_mode=).
        with OpenSSL::SSL::VERIFY_NONE

      @oauth_login_request.http
    end
  end

  describe '#request' do
    before do
      @oauth_login_request.stubs(:params).returns @params = {}
    end

    it 'instantiates a new Post object with the resource path passed in' do
      @oauth_login_request.request.path.
        must_equal @oauth_login_request.resource_path
    end

    it 'sets the data form with the params' do
      Net::HTTP::Post.any_instance.expects(:set_form_data).
        with @params

      @oauth_login_request.request
    end
  end

  describe '#params' do
    it 'gets the params as a hash' do
      params_source = OpenStruct.new(as_hash: {})
      @oauth_login_request.stubs(:params_source).returns params_source

      @oauth_login_request.params.must_equal({
        name:        @email,
        password:    @password,
        oauth_token: @oauth_token
      })
    end
  end
end
