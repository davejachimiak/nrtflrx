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
  end

  describe '#authenticate' do
    describe 'success' do
      before do
        @subscriber_authenticator.stubs(:success?).returns true
      end

      it 'returns true' do
        @subscriber_authenticator.authenticate.must_equal true
      end
    end
  end
end
