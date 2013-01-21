require_relative '../lib/nrtflrx'
require_relative 'spec_helper'

describe Nrtflrx do
  describe '#consumer_key' do
    it 'is an attr_accessor' do
      Nrtflrx.consumer_key = 'BLARGH'

      Nrtflrx.consumer_key.must_equal 'BLARGH'
    end
  end

  describe '#shared_secret' do
    it 'is an attr_accessor' do
      Nrtflrx.shared_secret = 'BLURGH'

      Nrtflrx.shared_secret.must_equal 'BLURGH'
    end
  end

  describe '.instant_catalog' do
    it 'returns the instant catalog' do
      request = Nrtflrx::Request.new('catalog/titles/streaming')
      request.stubs(:send).returns 'THE INSTANT CATALOG'
      Nrtflrx::Request.stubs(:new).with('catalog/titles/streaming').returns request

      Nrtflrx.instant_catalog.must_equal 'THE INSTANT CATALOG'
    end
  end

  describe '.request_token' do
    it 'returns a request token to be used for getting user authenticators' do
      request = Nrtflrx::Request.new('oauth/request_token')
      request.stubs(:send).returns 'Eyes Wide Shut'
      Nrtflrx::Request.stubs(:new).with('oauth/request_token').returns request

      Nrtflrx.request_token.must_equal 'Eyes Wide Shut'
    end
  end
end
