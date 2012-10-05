require_relative 'request'

module Nrtflrx
  class Catalog
    def self.request
      request = Nrtflrx::Request.new('catalog/titles')

      request.execute
    end
  end
end
