require_relative '../../../../lib/nrtflrx/request/params/signature'

require 'minitest/autorun'
require 'mocha'
require 'openssl'
require 'base64'


describe Nrtflrx::Request::Params::Signature do
  before do
    @request_mock = mock
    @signature = Nrtflrx::Request::Params::Signature.new(@request_mock, 'parums')
  end

  describe 'initialize' do
    describe 'initializes the request object' do
      it 'one way' do
        request_ivar = @signature.instance_variable_get :@request

        request_ivar.must_equal @request_mock
      end

      it 'another way' do
        signature = Nrtflrx::Request::Params::Signature.new('pretty please', 'parums')
        request_ivar = signature.instance_variable_get :@request

        request_ivar.must_equal 'pretty please'
      end
    end

    describe 'initializes the params object' do
      it 'one way' do
        request_ivar = @signature.instance_variable_get :@params

        request_ivar.must_equal 'parums'
      end

      it 'another way' do
        signature = Nrtflrx::Request::Params::Signature.new('pretty please', 'parooms')
        params_ivar = signature.instance_variable_get :@params

        params_ivar.must_equal 'parooms'
      end
    end
  end

  describe '#request' do
    it 'returns the request ivar' do
      request = @signature.request

      request.must_equal @request_mock
    end
  end

  describe '#sign' do
    it 'uses a SHA1 object to sign base string with consumer key, encodes ' +
      'the signature with Base64, chomps the encoding, and escapes the ' +
      'signature with CGI' do
      skip 'TODO: consumer key as attr_reader'
      request = mock(:oauth_consumer_key)
      request.stubs(:oauth_consumer_key).returns 'consumer key'
      signature = Nrtflrx::Request::Params::Signature.new(request, 'params')
      signature.stubs(:base_string).returns 'base string'
      OpenSSL::Digest::SHA1.stubs(:new).returns 'the digest'
      OpenSSL::HMAC.stubs(:digest).with('the digest', 'consumer key', 'base string').
        returns 'raw signature'
      Base64.stubs(:encode64).with('raw signature').returns 'encoded signature=\n'

      signed_signature = @signature.sign

      signed_signature.must_equal 'encoded+signature%3D'
    end
  end
end
