require_relative '../../../lib/nrtflrx/request/params'
require_relative '../../spec_helper'

describe Nrtflrx::Request::Params do
  before do
    Nrtflrx.stubs(:consumer_key).returns 'coolio'
    Time.stubs(:now).returns Time.mktime(2001)
    @params = Nrtflrx::Request::Params.new('base path')
  end

  describe 'initialize' do
    it 'sets @request to the request passed in' do
      request_ivar = @params.instance_variable_get(:@base_path)

      request_ivar.must_equal 'base path'
    end

    it 'sets @oauth_consumer_key to the consumer key' do
      oauth_consumer_key_ivar = @params.instance_variable_get :@oauth_consumer_key

      oauth_consumer_key_ivar.must_equal 'coolio'
    end

    it 'sets @oauth_nonce to the nonce' do
      oauth_nonce_ivar = @params.instance_variable_get :@oauth_nonce

      oauth_nonce_ivar.must_be :>=, 1
      oauth_nonce_ivar.must_be :<=, 1000000000
    end

    it 'sets @oauth_signature_method to HMAC-SHA1' do
      oauth_signature_method_ivar = @params.instance_variable_get :@oauth_signature_method

      oauth_signature_method_ivar.must_equal 'HMAC-SHA1'
    end

    it 'sets @oauth_timestamp to the number of seconds from 1970 to now' do
      oauth_timestamp_ivar = @params.instance_variable_get :@oauth_timestamp

      oauth_timestamp_ivar.must_equal Time.mktime(2001).to_i
    end

    it 'sets @oauth_version to 1.0' do
      oauth_version_ivar = @params.instance_variable_get :@oauth_version

      oauth_version_ivar.must_equal '1.0'
    end
  end

  describe '#add_signature' do
    it "adds the oauth_signature to the param's ivars" do
      @params.stubs(:oauth_signature).returns 'so signy'

      @params.add_signature

      oauth_signature_ivar = @params.instance_variable_get :@oauth_signature
      oauth_signature_ivar.must_equal 'so signy'
    end
  end

  describe '#as_hash' do
    it 'returns a string of the other methods names in this class and their values' do
      @params.stubs(:instance_variables).returns [:@daemon, :@father, :@base_path]
      @params.stubs(:instance_variable_get).with(:@daemon).returns 'omen'
      @params.stubs(:instance_variable_get).with(:@father).returns 'Robert'
      @params.stubs(:oauth_signature).returns 'hancock'

      params_hash = @params.as_hash

      params_hash.must_equal({ daemon: 'omen', father: 'Robert' })
    end
  end

  describe '#oauth_signature' do
    it 'calls sign on a signature object, to which other params and ' +
      'the base path are passed' do
    end
  end
end
