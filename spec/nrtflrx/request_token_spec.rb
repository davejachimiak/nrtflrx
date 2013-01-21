require_relative '../spec_helper'
require_relative '../../lib/nrtflrx'

describe Nrtflrx::RequestToken do
  describe '#initialize' do
    it 'sets the bare request token to #as_params_string' do
      request = Nrtflrx::Request.new 'oauth/request_token'
      Nrtflrx::Request.stubs(:new).with('oauth/request_token').returns request
      request.stubs(:submit).returns 'PARAMS STRING'

      request_token = Nrtflrx::RequestToken.new

      request_token.as_params_string.must_equal 'PARAMS STRING'
    end
  end
end
