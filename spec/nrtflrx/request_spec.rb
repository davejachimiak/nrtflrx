require_relative '../../lib/nrtflrx/request.rb'

require 'minitest/autorun'
require 'mocha'

describe Nrtflrx::Request do
  describe 'initialize' do
    describe 'instantiates resource path' do
      it 'instantiates path/so_cool' do
        request       = Nrtflrx::Request.new('path/so_cool', 'foo')
        resource_path = request.resource_path

        resource_path.must_equal 'path/so_cool'
      end

      it 'instantiates path/tubular' do
        request       = Nrtflrx::Request.new('path/tubular', 'foo')
        resource_path = request.resource_path

        resource_path.must_equal 'path/tubular'
      end
    end

    describe 'instantiates the http verb' do
      it 'with GET' do
        request = Nrtflrx::Request.new('foo', 'GET')
        verb = request.verb

        verb.must_equal 'GET'
      end

      it 'with PUT' do
        request = Nrtflrx::Request.new('foo', 'PUT')
        verb = request.verb

        verb.must_equal 'PUT'
      end
    end
  end

  describe '#base_url' do
    it "returns the netflix api's base url" do
      request  = Nrtflrx::Request.new('foo', 'bar')
      base_url = request.base_url

      base_url.must_equal 'http://api-public.netflix.com'
    end
  end
end
