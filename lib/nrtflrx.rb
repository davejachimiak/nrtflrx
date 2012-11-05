require 'cgi'
require 'base64'
require 'net/http'

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'nrtflrx'
require 'nrtflrx/request'
require 'nrtflrx/request/params'
require 'nrtflrx/request/params/signature'
require 'nrtflrx/queue'

module Nrtflrx
  class << self
    attr_accessor :consumer_key, :shared_secret
  end

  def self.catalog
    Nrtflrx::Request.new('catalog/titles/index').send
  end

  def self.request_token
    Nrtflrx::Request.new('oauth/request_token').send
  end

  def self.Queue(user_authenticators)
    Nrtflrx::Queue.new(user_authenticators)
  end
end
