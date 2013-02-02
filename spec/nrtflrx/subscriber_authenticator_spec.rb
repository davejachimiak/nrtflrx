require_relative '../spec_helper'
require_relative '../../lib/nrtflrx'

describe Nrtflrx::SubscriberAuthenticator do
  before do
    @email                    = 'email'
    @password                 = 'password'
    @request_token            = mock
    @subscriber_authenticator = Nrtflrx::SubscriberAuthenticator.
      new @email, @password, @oauth_token
  end

  describe '#initialize' do
    it 'sets an authenticator request object' do
      Nrtflrx::OAuthLoginRequest.stubs(:new).
        with(@email, @password, @request_token).
        returns request = mock

      subscriber_authenticator = Nrtflrx::SubscriberAuthenticator.
        new @email, @password, @request_token

      subscriber_authenticator.request.must_equal request
    end
  end

  describe '#authenticate' do
    before do
      @subscriber_authenticator.stubs(:submit_request).returns 'response'
    end

    describe 'success' do
      before do
        @subscriber_authenticator.stubs(:success?).with('response').
          returns true
      end

      it 'returns true' do
        @subscriber_authenticator.authenticate.must_equal true
      end
    end

    describe 'failure' do
      before do
        @subscriber_authenticator.stubs(:success?).with('response').
          returns false
      end

      it 'returns false' do
        @subscriber_authenticator.authenticate.must_equal false
      end
    end
  end

  describe '#submit_request' do
    it 'submits the request' do
      @subscriber_authenticator.request.expects(:submit)

      @subscriber_authenticator.submit_request
    end
  end

  describe '#success?' do
    it '' do
      skip 'waiting for completion of OAuth Login Request object'
    end
  end
end
