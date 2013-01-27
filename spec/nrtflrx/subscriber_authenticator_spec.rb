require_relative '../spec_helper'
require_relative '../../lib/nrtflrx'

describe Nrtflrx::SubscriberAuthenticator do
  describe '#initialize' do
    it 'sets the passed in email' do
      email = 'email'
      subscriber_authenticator = Nrtflrx::SubscriberAuthenticator.new email

      subscriber_authenticator.email.must_equal email
    end
  end
end
