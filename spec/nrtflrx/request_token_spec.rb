require_relative '../spec_helper'
require_relative '../../lib/nrtflrx'

describe Nrtflrx::RequestToken do
  before do
    request = Nrtflrx::Request.new 'oauth/request_token'
    Nrtflrx::Request.stubs(:new).with('oauth/request_token').returns request
    request.stubs(:submit).
      returns 'oauth_token=psvd6ta236taungqxrjhbkat&oauth_token_secret=ejSFZuWhe7eE&application_name=A+Better+Queue&login_url=https%3A%2F%2Fapi-user.netflix.com%2Foauth%2Flogin%3Foauth_token%3Dpsvd6ta236taungqxrjhbkat'

    @request_token = Nrtflrx::RequestToken.new
  end

  describe '#oauth_token' do
    it 'returns the oauth token' do
      @request_token.oauth_token.must_equal 'psvd6ta236taungqxrjhbkat'
    end
  end

  describe '#oauth_token_secret' do
    it 'returns the oauth token secret' do
      @request_token.oauth_token_secret.must_equal 'ejSFZuWhe7eE'
    end
  end
end
