module Nrtflrx
  class Catalog
    def self.request
      Nrtflrx::Request.new('catalog/titles/index').send
    end
  end
end
