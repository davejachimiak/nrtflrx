require_relative '../../spec_helper'
require_relative '../../../lib/nrtflrx/queue/subscriber'

describe Nrtflrx::Queue::Subscriber do
  before do
    @login_credentials = { email: 'd@d.com', password: 'pw' }
    @subscriber        = Nrtflrx::Queue::Subscriber.new(@login_credentials)
  end

  describe 'initialize' do
    it 'instantiates @login_credentials' do
      login_credentials_ivar = @subscriber.instance_variable_get :@login_credentials

      login_credentials_ivar.must_equal @login_credentials
    end
  end

  describe '#set_request_token' do
    it 'sets the request token' do
      Nrtflrx.stubs(:request_token).returns 'Block Party IV'

      @subscriber.set_request_token
      request_token_ivar = @subscriber.instance_variable_get :@request_token

      request_token_ivar.must_equal 'Block Party IV'
    end
  end

  describe '#tokens' do
    it "returns the subscriber's oauth tokens" do
    end
  end
end
