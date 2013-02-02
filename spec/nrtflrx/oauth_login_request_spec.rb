require_relative '../spec_helper'
require_relative '../../lib/nrtflrx'

describe Nrtflrx::OAuthLoginRequest do
  before do
    @email               = 'email'
    @password            = 'password'
    @oauth_login_request = Nrtflrx::OAuthLoginRequest.new @email, @password
  end

  describe 'initialize' do
    it 'sets the email passed in' do
      @oauth_login_request.email.must_equal @email
    end

    it 'sets the password passed in' do
      @oauth_login_request.password.must_equal @password
    end

    it 'sets the resource path' do
      @oauth_login_request.resource_path.must_equal '/oauth/login'
    end

    it 'sets the sub domain' do
      @oauth_login_request.sub_domain.must_equal 'api-user'
    end
  end

  describe '#request' do
    it 'instantiates a new Post object with the resource path passed in'
    it 'sets the data form with the params'
  end

  describe '#submit' do
    it 'calls request on the http object with the request object'
    it 'returns the response body'
  end

  describe '#http' do
    it "is a new http object based on the uri's host and port"
    it "sets use ssl to true"
    it "sets the verify mode to verify none"
  end

  describe '#params' do
    it 'gets the params as a hash' do
      params_source = OpenStruct.new(as_hash: {})
      Nrtflrx::OAuthLoginRequest::Params.stubs(:new).returns params_source

      @oauth_login_request.params.
        must_equal({ name: @email, password: @password })
    end
  end
end
