require_relative '../../lib/nrtflrx/request.rb'

require 'minitest/autorun'
require 'mocha'

describe Nrtflrx::Request do
  before do
    @request = Nrtflrx::Request.new('clown_sauce')
  end

  describe '#initialize' do
    it 'instantiates the resource_path with poop' do
      resource_path_ivar = @request.instance_variable_get(:@resource_path)

      resource_path_ivar.must_equal 'clown_sauce'
    end

    it 'instantiates the resource_path with great' do
      request = Nrtflrx::Request.new('great')
      resource_path_ivar = request.instance_variable_get(:@resource_path)

      resource_path_ivar.must_equal 'great'
    end
  end

  describe '#resource_path' do
    it 'is an attr_reader' do
      resource_path = @request.resource_path

      resource_path.must_equal 'clown_sauce'
    end
  end

  describe '#execute' do
    it 'performs a get request with the request uri' do
      @request.stubs(:uri).returns 'sauce'
      Net::HTTP.expects(:get_response).with 'sauce'

      @request.execute
    end
  end

  describe '#uri' do
    it 'is a url string wrapped in a uri object' do
      @request.stubs(:base_url).returns 'base_url'
      @request.stubs(:resource_path).returns 'resource_path'
      @request.stubs(:params).returns({ param1: 'PARAM1', param2: 'PARAM2' })

      uri = @request.uri

      uri.path.must_equal 'base_url/resource_path'
      uri.query.must_equal 'param1=PARAM1&param2=PARAM2'
    end
  end
end
