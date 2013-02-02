require_relative '../spec_helper'
require_relative '../../lib/nrtflrx'

describe Nrtflrx::SubscriberAuthenticator do
  before do
    @email                    = 'email'
    @password                 = 'password'
    @subscriber_authenticator = Nrtflrx::SubscriberAuthenticator.
      new @email, @password
  end

  describe '#initialize' do
    it 'sets the passed in email' do
      @subscriber_authenticator.email.must_equal @email
    end

    it 'sets the passed in password' do
      @subscriber_authenticator.password.must_equal @password
    end

    it 'sets an authenticator request object' do
      request = Nrtflrx::Request.new('oauth/login', 'api-user')
      Nrtflrx::Request.stubs(:new).with('oauth/login', 'api-user').
        returns request

      subscriber_authenticator = Nrtflrx::SubscriberAuthenticator.
        new @email, @password

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
      skip 'waiting for completion of new Request object'
    end
  end
end
