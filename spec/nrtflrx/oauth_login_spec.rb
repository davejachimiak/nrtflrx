require_relative '../spec_helper'
require_relative '../../lib/nrtflrx'

describe Nrtflrx::OAuthLogin do
  before do
    @request_token = OpenStruct.new application_name: 'PoopFLIX'
    Nrtflrx::RequestToken.stubs(:new).
      returns @request_token
    @oauth_login = Nrtflrx::OAuthLogin.new 'dave.jachimiak@gmail.com', 'password'
  end

  describe '#initialize' do
    it 'instantiates a request token object' do
      @oauth_login.request_token.must_equal @request_token
    end

    it 'instantiates name' do
      @oauth_login.name.must_equal 'dave.jachimiak@gmail.com'
    end

    it 'instantiates password' do
      @oauth_login.password.must_equal 'password'
    end

    it 'instantiates a nilly oauth_callback' do
      @oauth_login.oauth_callback.must_be_nil
    end

    it 'instantiates accpet_tos as true' do
      @oauth_login.accept_tos.must_equal true
    end

    it 'instantiates the application name' do
      @oauth_login.application_name.must_equal @request_token.application_name
    end
  end
end
