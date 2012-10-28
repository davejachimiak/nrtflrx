require 'cgi'
require 'base64'
require 'net/http'

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'nrtflrx'
require 'nrtflrx/catalog'
require 'nrtflrx/request'
require 'nrtflrx/request/params'
require 'nrtflrx/request/params/signature'

module Nrtflrx
  class << self
    attr_accessor :consumer_key, :shared_secret
  end
end
