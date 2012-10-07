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

      get.must_equal({ daemon: 'omen', father: 'Robert' })
    end
  end
end
