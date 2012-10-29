require_relative '../../lib/nrtflrx/catalog.rb'
require_relative '../spec_helper'

describe Nrtflrx::Catalog do
  describe '#request' do
    it 'executes a request with the catalog path' do
      request = Nrtflrx::Request.new('catalog/titles/index')
      request.expects(:execute)
      Nrtflrx::Request.expects(:new).with('catalog/titles/index').returns request

      Nrtflrx::Catalog.request
    end
  end
end
