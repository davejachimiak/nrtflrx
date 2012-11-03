require_relative '../../lib/nrtflrx.rb'
require_relative '../../lib/nrtflrx/request.rb'
require_relative '../../lib/nrtflrx/request/params.rb'
require_relative '../spec_helper'

describe Nrtflrx::Request do
  before do
    @request = Nrtflrx::Request.new('clown_sauce')
  end

  describe '#initialize' do
    describe '@resource_path' do
      it 'instantiates the resource_path with clown_sauce' do
        resource_path_ivar = @request.instance_variable_get(:@resource_path)

        resource_path_ivar.must_equal 'clown_sauce'
      end

      it 'instantiates the resource_path with great' do
        request            = Nrtflrx::Request.new('great')
        resource_path_ivar = request.instance_variable_get(:@resource_path)

        resource_path_ivar.must_equal 'great'
      end
    end

    describe '@sub_domain' do
      it "defaults to 'api-public'" do
        sub_domain_ivar = @request.instance_variable_get :@sub_domain

        sub_domain_ivar.must_equal 'api-public'
      end

      it 'is set to the sub_domain passed in' do
        request = Nrtflrx::Request.new('', 'poofington')

        sub_domain_ivar = request.instance_variable_get :@sub_domain

        sub_domain_ivar.must_equal 'poofington'
      end
    end
  end

  describe '#resource_path' do
    it 'is an attr_reader' do
      resource_path = @request.resource_path

      resource_path.must_equal 'clown_sauce'
    end
  end

  describe '#sub_domain' do
    it 'is an attr_reader' do
      @request.sub_domain.must_equal 'api-public'
    end
  end

  describe '#send' do
    it 'performs a get request with the request uri' do
      @request.stubs(:uri).returns 'sauce'
      Net::HTTP.expects(:get).with 'sauce'

      @request.send
    end
  end

  describe '#uri' do
    it 'is a url string wrapped in a uri object' do
      @request.stubs(:base_path).returns 'base_url/resource_path'
      @request.stubs(:params).returns({ param1: 'PARAM1', param2: 'PARAM2=' })

      uri = @request.uri

      uri.path.must_equal 'base_url/resource_path'
      uri.query.must_equal 'param1=PARAM1&param2=PARAM2%3D'
    end
  end

  describe '#base_path' do
    describe 'with the default sub-domain' do
      it 'returns the base path with the default sub-domain and resource path' do
        base_path = @request.base_path

        base_path.must_equal 'http://api-public.netflix.com/clown_sauce'
      end
    end

    describe 'with an over-riding sub-domain' do
      it 'returns the base path with the over-riding sub-domain and resource path' do
        request = Nrtflrx::Request.new('poof_boss', 'poofington')

        base_path = request.base_path

        base_path.must_equal 'http://poofington.netflix.com/poof_boss'
      end
    end
  end

  describe '#params' do
    it 'calls Nrtflrx::Request::Params.new.as_hash' do
      params = Nrtflrx::Request::Params.new(@request.base_path)
      params.expects(:as_hash)
      params.expects(:add_signature)
      Nrtflrx::Request::Params.expects(:new).with(@request.base_path).returns params

      @request.params
    end
  end
end
