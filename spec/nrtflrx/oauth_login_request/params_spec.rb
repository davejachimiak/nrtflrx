require_relative '../../spec_helper'
require_relative '../../../lib/nrtflrx'

describe Nrtflrx::OAuthLoginRequest::Params do
  describe '#initialize' do
    before do
      Nrtflrx.consumer_key = @consumer_key = 'consumer key'
      @email    = 'email'
      @password = 'password'
      request_token = OpenStruct.new(
        oauth_token:      @oauth_token      = 'ot',
        application_name: @application_name = 'an'
      )
      @params   = Nrtflrx::OAuthLoginRequest::Params.
        new @email, @password, request_token
    end

    it 'sets name to the email passed in' do
      @params.instance_variable_get(:@name).must_equal @email
    end

    it 'sets password to the password passed in' do
      @params.instance_variable_get(:@password).must_equal @password
    end

    it 'sets the oauth token from the request token passed in' do
      @params.instance_variable_get(:@oauth_token).must_equal @oauth_token
    end

    it 'sets the application name from the request token passed in' do
      @params.instance_variable_get(:@application_name).
        must_equal @application_name
    end

    it 'sets accept_tos to true' do
      @params.instance_variable_get(:@accept_tos).must_equal true
    end

    it 'sets consumer key' do
      @params.instance_variable_get(:@oauth_consumer_key).
        must_equal @consumer_key
    end
  end
end
