require_relative '../../../lib/nrtflrx/request/params'

require 'minitest/autorun'
require 'mocha'

describe Nrtflrx::Request::Params do
  describe '#get' do
    it 'returns a hash of the other methods names in this class and their values' do
      params_class = Nrtflrx::Request::Params
      params_class.stubs(:public_methods).with(false).returns [:daemon, :father, :get]
      params_class.any_instance.stubs(:daemon).returns 'omen'
      params_class.any_instance.stubs(:father).returns 'Robert'

      params = Nrtflrx::Request::Params.new
      get    = params.get

      get[:daemon].must_equal 'omen'
      get[:father].must_equal 'Robert'
    end
  end

  describe '#oauth_consumer_key' do
    it 'returns the key from the top-level module method' do
      Nrtflrx.stubs(:consumer_key).returns 'bobo'

      params = Nrtflrx::Request::Params.new
      oauth_consumer_key = params.oauth_consumer_key

      oauth_consumer_key.must_equal 'bobo'
    end
  end
end
