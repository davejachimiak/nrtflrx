require_relative '../../../lib/nrtflrx/request/params'

require 'minitest/autorun'
require 'mocha'

describe Nrtflrx::Request::Params do
  before do
    @params = Nrtflrx::Request::Params.new('base path')
  end

  describe 'initialize' do
    it 'set @request to the request passed in' do
      request_ivar = @params.instance_variable_get(:@base_path)

      request_ivar.must_equal 'base path'
    end
  end

  describe '#as_hash' do
    it 'returns a hash of the other methods names in this class and their values' do
      params_class = Nrtflrx::Request::Params
      params_class.stubs(:public_methods).with(false).returns [:daemon, :father]
      params_class.any_instance.stubs(:daemon).returns 'omen'
      params_class.any_instance.stubs(:father).returns 'Robert'

      hash = @params.as_hash

      hash[:daemon].must_equal 'omen'
      hash[:father].must_equal 'Robert'
      hash[:get].must_be_nil
    end
  end

  describe '#oauth_consumer_key' do
    before do
      Nrtflrx.stubs(:consumer_key).returns 'bobo'

      @oauth_consumer_key = @params.oauth_consumer_key
    end

    it 'returns the key from the top-level module method' do
      @oauth_consumer_key.must_equal 'bobo'
    end

    it 'holds the value in an ivar named after the method' do
      oauth_consumer_key_ivar = @params.instance_variable_get :@oauth_consumer_key

      oauth_consumer_key_ivar.must_equal 'bobo'
    end
  end

  describe '#oauth_nonce' do
    it 'returns a random number between 1 and 1 billion' do
      oauth_nonce = @params.oauth_nonce

      oauth_nonce.must_be :>=, 1
      oauth_nonce.must_be :<=, 1000000000
    end

    it 'should memoize its first call' do
      first_call_oauth_nonce  = @params.oauth_nonce
      second_call_oauth_nonce = @params.oauth_nonce

      second_call_oauth_nonce.must_equal first_call_oauth_nonce
    end
  end

  describe '#oauth_signature_method' do
    before do
      @oauth_signature_method = @params.oauth_signature_method
    end

    it 'returns "HMAC-SHA1"' do
      @oauth_signature_method.must_equal 'HMAC-SHA1'
    end

    it 'holds the value in an ivar named after the method' do
      oauth_signature_method_ivar = @params.instance_variable_get :@oauth_signature_method

      oauth_signature_method_ivar.must_equal 'HMAC-SHA1'
    end
  end

  describe '#oauth_timestamp' do
    it 'memoizes the first call' do
      first_oauth_timestamp  = @params.oauth_timestamp
      sleep 1
      second_oauth_timestamp = @params.oauth_timestamp

      second_oauth_timestamp.must_equal first_oauth_timestamp
    end

    describe 'returns the number of seconds between the new years 1970 and now' do
      it 'if now is new years of 2001' do
        ny_2001 = Time.mktime(2001)
        Time.stubs(:now).returns ny_2001

        oauth_timestamp = @params.oauth_timestamp

        oauth_timestamp.must_equal '978325200'
      end

      it 'if now is new years of 2002' do
        ny_2002 = Time.mktime(2002)
        Time.stubs(:now).returns ny_2002

        oauth_timestamp = @params.oauth_timestamp

        oauth_timestamp.must_equal '1009861200'
      end
    end
  end

  describe '#oauth_version' do
    before do
      @oauth_version = @params.oauth_version
    end

    it 'returns "1.0"' do
      @oauth_version.must_equal '1.0'
    end

    it 'holds the value in an ivar named after the method' do
      oauth_version_ivar = @params.instance_variable_get :@oauth_version

      oauth_version_ivar.must_equal '1.0'
    end
  end

  describe '#oauth_signature' do
    it 'calls sign on a signature object, to which other params and ' +
      'the base path are passed' do
      hash = { oauth_consumer_key:     @params.oauth_consumer_key,
               oauth_nonce:            @params.oauth_nonce,
               oauth_signature_method: @params.oauth_signature_method,
               oauth_timestamp:        @params.oauth_timestamp,
               oauth_version:          @params.oauth_version }

      signature = Nrtflrx::Request::Params::Signature.new('base path', hash)
      signature.expects(:sign)
      Nrtflrx::Request::Params::Signature.expects(:new).with('base path', hash).returns signature

      @params.oauth_signature
    end
  end
end
