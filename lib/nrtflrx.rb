require 'base64'
require 'cgi'
require 'net/http'

$LOAD_PATH.unshift File.dirname __FILE__

module Nrtflrx
  require 'nrtflrx'
  require 'nrtflrx/queue'
  require 'nrtflrx/request'
  require 'nrtflrx/request_token'
  require 'nrtflrx/request/params'
  require 'nrtflrx/oauth_login_request'
  require 'nrtflrx/subscriber_authenticator'
  require 'nrtflrx/request/params/oauth_signature'

  class << self
    attr_accessor :consumer_key, :shared_secret
  end

  def self.instant_catalog
    Nrtflrx::SignedRequest.new('catalog/titles/streaming').submit
  end

  def self.request_token
    Nrtflrx::SignedRequest.new('oauth/request_token').submit
  end

  class BadConsumerKeyError < StandardError; end

  class BadRequestError < StandardError; end
end
