require_relative 'nrtflrx/catalog'

module Nrtflrx
  class << self
    attr_accessor :consumer_key, :shared_secret
  end
end
