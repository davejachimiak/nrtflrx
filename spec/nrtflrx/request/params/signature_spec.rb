require_relative '../../../../lib/nrtflrx/request/params/signature'

require 'minitest/autorun'
require 'mocha'
require 'openssl'
require 'base64'

describe Nrtflrx::Request::Params::Signature do
  before do
    @params_mock = mock
    @signature   = Nrtflrx::Request::Params::Signature.new('please', @params_mock)
  end

  describe 'initialize' do
    describe 'initializes the request object' do
      it 'one way' do
        request_ivar = @signature.instance_variable_get :@request

        request_ivar.must_equal 'please'
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

        request_ivar.must_equal @params_mock
      end

      it 'another way' do
        signature = Nrtflrx::Request::Params::Signature.new('pretty please', 'parooms')
        params_ivar = signature.instance_variable_get :@params

        params_ivar.must_equal 'parooms'
      end
    end
  end

  describe '#params' do
    it 'returns the params ivar' do
      params = @signature.params

      params.must_equal @params_mock
    end
  end

  describe '#request' do
    it 'returns the request ivar' do
      request = @signature.request

      request.must_equal 'please'
    end
  end

  describe '#sign' do
    it 'uses a SHA1 object to sign base string with consumer key, encodes ' +
      'the signature with Base64, chomps the encoding, and escapes the ' +
      'signature with CGI' do
      params = Nrtflrx::Request::Params.new('request')
      params.stubs(:oauth_consumer_key).returns 'consumer key'
      Nrtflrx::Request::Params.stubs(:new).with('request').returns params

      signature = Nrtflrx::Request::Params::Signature.new('request', params)
      signature.stubs(:base_string).returns 'base string'
      OpenSSL::Digest::SHA1.stubs(:new).returns 'the digest'
      OpenSSL::HMAC.stubs(:digest).with('the digest', 'consumer key', 'base string').
        returns 'raw signature'
      Base64.stubs(:encode64).with('raw signature').returns "encoded signature=\n"

      signed_signature = signature.sign

      signed_signature.must_equal 'encoded+signature%3D'
    end
  end

  describe '#base_string' do
    it 'joins percent encoded http verb, base url with resource path, and params ' +
      'sans oauth_signature with &' do
      request = Nrtflrx::Request.new('resource_path')
      params  = Nrtflrx::Request::Params.new(request)
      #params.stubs(:a).returns 'fun'
      #params.stubs(:b).returns 'cool'
      #params.stubs(:c).returns 'nice'
      #Nrtflrx::Request::Params.stubs(:new).with(request).returns params

      signature = Nrtflrx::Request::Params::Signature.new(request, params)

      base_string = signature.base_string

      base_string.must_equal 'GET&base_url%2Fresource_path&a%3Dfun%26b%3Dcool%26c%3Dnice'
    end
  end
end
