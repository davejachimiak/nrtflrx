require_relative '../spec_helper'
require_relative '../../lib/nrtflrx'

require 'net/http'

describe Nrtflrx::UserAuthenticators do
  before do
    @login_info          = { name: 'cool@cool.com', password: 'cool' }
    @user_authenticators = Nrtflrx::UserAuthenticators.new(@login_info)
  end

  describe 'initialize' do
    it 'initializes @name' do
      name_ivar = @user_authenticators.instance_variable_get :@name

      name_ivar.must_equal 'cool@cool.com'
    end

    it 'initializes @password' do
      password_ivar = @user_authenticators.instance_variable_get :@password

      password_ivar.must_equal 'cool'
    end
  end

  describe '#set_authenticators' do
  end
end
