class Nrtflrx::OAuthLogin
  attr_reader :request_token, :name, :password, :oauth_callback, :accept_tos,
              :application_name

  def initialize name, password
    @request_token    = Nrtflrx::RequestToken.new
    @password         = password
    @name             = name
    @oauth_callback   = nil
    @accept_tos       = true
    @application_name = @request_token.application_name
  end
end
