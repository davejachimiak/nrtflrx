require_relative '../lib/nrtflrx'

require 'minitest/autorun'

describe Nrtflrx do
  describe '#consumer_key' do
    it 'is an attr_accessor' do
      Nrtflrx.consumer_key.must_be_nil

      Nrtflrx.consumer_key = 'BLARGH'

      Nrtflrx.consumer_key.must_equal 'BLARGH'
    end
  end
end
