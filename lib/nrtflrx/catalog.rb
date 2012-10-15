require_relative 'request'

module Nrtflrx
  class Catalog
    def self.request
      request = Nrtflrx::Request.new('catalog/titles/index')

      request.execute
    end
  end
end
