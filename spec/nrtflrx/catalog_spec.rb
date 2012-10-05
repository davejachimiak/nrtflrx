require_relative '../../lib/nrtflrx/catalog.rb'

require 'minitest/autorun'
require 'mocha'

describe Nrtflrx::Catalog do
  describe '#request' do
    it 'executes a request with the catalog path' do
      request = Nrtflrx::Catalog.new
      request.expects(:execute)
      Nrtflrx::Request.expects(:new).with('catalog/titles').returns request

      Nrtflrx::Catalog.request
    end
  end
end
