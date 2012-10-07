require_relative '../../../lib/nrtflrx/request/params'

require 'minitest/autorun'
require 'mocha'

describe Nrtflrx::Request::Params do
  before do
    @params = Nrtflrx::Request::Params.new
  end

  describe '#get' do
    it 'returns a hash of the other methods names in this class and their values' do
      params_class = Nrtflrx::Request::Params
      params_class.stubs(:public_methods).with(false).returns [:daemon, :father, :get]
      params_class.any_instance.stubs(:daemon).returns 'omen'
      params_class.any_instance.stubs(:father).returns 'Robert'

      get = @params.get

      get[:daemon].must_equal 'omen'
      get[:father].must_equal 'Robert'
    end
  end

  describe '#oauth_consumer_key' do
    it 'returns the key from the top-level module method' do
      Nrtflrx.stubs(:consumer_key).returns 'bobo'

      oauth_consumer_key = @params.oauth_consumer_key

      oauth_consumer_key.must_equal 'bobo'
    end
  end

  describe '#oauth_nonce' do
    it 'returns a random number between 1 and 1 billion' do
      oauth_nonce = @params.oauth_nonce

      oauth_nonce.must_be :>=, 1
      oauth_nonce.must_be :<=, 1000000000
    end
  end
end
