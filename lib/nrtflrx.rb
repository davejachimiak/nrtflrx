require 'base64'
require 'cgi'
require 'net/http'

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'nrtflrx'
require 'nrtflrx/request'
require 'nrtflrx/request/params'
require 'nrtflrx/request/params/oauth_signature'

module Nrtflrx
  class << self
    attr_accessor :consumer_key, :shared_secret
  end

  def self.instant_catalog
    Nrtflrx::Request.new('catalog/titles/streaming').send
  end

  def self.request_token
    Nrtflrx::Request.new('oauth/request_token').send
  end
end
