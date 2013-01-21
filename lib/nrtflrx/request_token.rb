require 'ostruct'

class Nrtflrx::RequestToken
  def initialize
    response_string = Nrtflrx::Request.new('oauth/request_token').submit
    response_hash   = Hash[CGI.parse(response_string).map do |k, v|
      [k, v.first]
    end]

    self.class.class_eval do
      response_hash.each_pair do |k, v|
        define_method k.to_sym do
          v
        end
      end
    end
  end
end
