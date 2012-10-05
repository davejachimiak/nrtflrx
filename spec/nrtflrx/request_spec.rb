require_relative '../../lib/nrtflrx/request.rb'

require 'minitest/autorun'
require 'mocha'

describe Nrtflrx::Request do
  before do
    @request = Nrtflrx::Request.new('clown sauce')
  end

  describe '#initialize' do
    it 'instantiates the resource_path with poop' do
      resource_path_ivar = @request.instance_variable_get(:@resource_path)

      resource_path_ivar.must_equal 'clown sauce'
    end

    it 'instantiates the resource_path with great' do
      resource_path_ivar = @request.instance_variable_get(:@resource_path)

      resource_path_ivar.must_equal 'great'
    end
  end

  describe '#resource_path' do
    it 'is an attr_reader' do
      resource_path = @request.resource_path

      resource_path.must_equal 'clown sauce'
    end
  end
end
