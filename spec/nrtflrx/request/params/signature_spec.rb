require_relative '../../../../lib/nrtflrx/request/params/signature'
require_relative '../../../spec_helper'

describe Nrtflrx::Request::Params::Signature do
  before do
    @signature = Nrtflrx::Request::Params::Signature.new('base path', { cool: 'too cool' })
  end

  describe 'initialize' do
    describe 'initializes the base path' do
      it 'one way' do
        base_path_ivar = @signature.instance_variable_get :@base_path

        base_path_ivar.must_equal 'base path'
      end

      it 'another way' do
        signature = Nrtflrx::Request::Params::Signature.new('pretty please', {})
        base_path = signature.instance_variable_get :@base_path

        base_path.must_equal 'pretty please'
      end
    end

    describe 'initializes the params hash' do
      it 'one way' do
        params_ivar = @signature.instance_variable_get :@params

        params_ivar.must_equal({ cool: 'too cool' })
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
      base_path = @signature.base_path

      base_path.must_equal 'base path'
    end
  end

  describe '#params' do
    it 'returns the params ivar' do
      params = @signature.params

      params.must_equal({ cool: 'too cool' })
    end
  end

  describe '#sign' do
    it 'uses a SHA1 object to sign base string with consumer key, encodes ' +
      'the signature with Base64, chomps the encoding, and escapes the ' +
      'signature with CGI' do
      signature = Nrtflrx::Request::Params::Signature.new('base path', { oauth_consumer_key: 'consumer key' })
      signature.stubs(:base_string).returns 'base string'
      Nrtflrx.stubs(:shared_secret).returns 'shared secret'
      OpenSSL::Digest::SHA1.stubs(:new).returns 'the digest'
      OpenSSL::HMAC.stubs(:digest).with('the digest', 'shared secret&', 'base string').
        returns 'raw signature'
      Base64.stubs(:encode64).with('raw signature').returns "encodedsignature=\n"

      signed_signature = signature.sign

      signed_signature.must_equal 'encodedsignature='
    end
  end

  describe '#base_string' do
    it 'joins percent encoded http verb, base url with resource path, and params ' +
      'sans oauth_signature with &' do
      params = { oauth_consumer_key: 'noon*#?',
                 oauth_banche:       'which' }

      signature = Nrtflrx::Request::Params::Signature.new('base_url/resource_path', params)
      base_string = signature.base_string

      base_string.must_equal 'GET&base_url%2Fresource_path&oauth_banche%3Dwhich%26oauth_consumer_key%3Dnoon%2A%23%3F'
    end
  end
end
