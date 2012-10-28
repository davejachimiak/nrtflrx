require_relative '../lib/nrtflrx'
require_relative 'spec_helper'

describe Nrtflrx do
  describe '#consumer_key' do
    it 'is an attr_accessor' do
      Nrtflrx.consumer_key.must_be_nil

      Nrtflrx.consumer_key = 'BLARGH'

      Nrtflrx.consumer_key.must_equal 'BLARGH'
    end
  end

  describe '#shared_secret' do
    it 'is an attr_accessor' do
      Nrtflrx.shared_secret.must_be_nil

      Nrtflrx.shared_secret = 'BLURGH'

      Nrtflrx.shared_secret.must_equal 'BLURGH'
    end
  end
end
