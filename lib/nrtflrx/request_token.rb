class Nrtflrx::RequestToken
  attr_reader :as_params_string

  def initialize
    @as_params_string = Nrtflrx::Request.new('oauth/request_token').submit
  end
end
