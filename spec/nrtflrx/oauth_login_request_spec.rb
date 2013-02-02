require_relative '../spec_helper'
require_relative '../../lib/nrtflrx'

describe Nrtflrx::OAuthLoginRequest do
  describe 'initialize' do
    it 'sets the email passed in' do
      email = 'email'

      oauth_login_request = Nrtflrx::OAuthLoginRequest.new email

      oauth_login_request.email.must_equal email
    end
  end
end
