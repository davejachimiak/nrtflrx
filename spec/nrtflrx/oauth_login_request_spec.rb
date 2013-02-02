require_relative '../spec_helper'
require_relative '../../lib/nrtflrx'

describe Nrtflrx::OAuthLoginRequest do
  describe 'initialize' do
    before do
      @email = 'email'
      @password = 'password'
      @oauth_login_request = Nrtflrx::OAuthLoginRequest.new @email, @password
    end

    it 'sets the email passed in' do
      @oauth_login_request.email.must_equal @email
    end

    it 'sets the password passed in' do
      @oauth_login_request.password.must_equal @password
    end
  end
end
