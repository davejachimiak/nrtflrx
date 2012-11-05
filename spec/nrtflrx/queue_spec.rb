require_relative '../spec_helper'
require_relative '../../lib/nrtflrx/queue'
require_relative '../../lib/nrtflrx/queue/subscriber'

describe Nrtflrx::Queue do
  before do
    @login_credentials = { email: 'd@d.com', password: 'pw' }
    @queue = Nrtflrx::Queue.new(@login_credentials)
  end

  describe 'initialize' do
    it 'calls #set_subscriber_tokens' do
      Nrtflrx::Queue.any_instance.expects(:set_subscriber_tokens)
      Nrtflrx::Queue.new('poop')
    end

    describe 'instantiates @login_credentials' do
      it 'with Tucker' do
        @queue.instance_variable_get(:@login_credentials).must_equal @login_credentials
      end

      it 'with Dale' do
        queue = Nrtflrx::Queue.new('Dale')

        queue.instance_variable_get(:@login_credentials).must_equal 'Dale'
      end
    end
  end

  describe '#login_credentials' do
    it 'is an attr_reader' do
      @queue.login_credentials.must_equal @login_credentials
    end
  end

  describe '#set_subscriber_tokens' do
    it 'sets @subscriber_tokens using the login_credentials' do
      subscriber = Nrtflrx::Queue::Subscriber.new(@login_credentials)
      subscriber.expects(:set_request_token)
      subscriber.stubs(:tokens).returns 'watching Practical Magic with the gf'
      Nrtflrx::Queue::Subscriber.stubs(:new).with(@login_credentials).returns subscriber

      @queue.set_subscriber_tokens
      subscriber_tokens_ivar = @queue.instance_variable_get :@subscriber_tokens

      subscriber_tokens_ivar.must_equal 'watching Practical Magic with the gf'
    end
  end
end
