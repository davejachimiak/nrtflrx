require_relative '../../../../lib/nrtflrx/request/params/signature'

require 'minitest/autorun'

describe Nrtflrx::Request::Params::Signature do
  describe 'initialize' do
    describe 'initializes the request object' do
      it 'one way' do
        signature = Nrtflrx::Request::Params::Signature.new('please', 'parums')
        request_ivar = signature.instance_variable_get :@request

        request_ivar.must_equal 'please'
      end

      it 'another way' do
        signature = Nrtflrx::Request::Params::Signature.new('pretty please', 'parums')
        request_ivar = signature.instance_variable_get :@request

        request_ivar.must_equal 'pretty please'
      end
    end

    describe 'initializes the params object' do
      it 'one way' do
        signature = Nrtflrx::Request::Params::Signature.new('please', 'parums')
        request_ivar = signature.instance_variable_get :@params

        request_ivar.must_equal 'parums'
      end

      it 'another way' do
        signature = Nrtflrx::Request::Params::Signature.new('pretty please', 'parooms')
        params_ivar = signature.instance_variable_get :@params

        params_ivar.must_equal 'parooms'
      end
    end
  end
end
