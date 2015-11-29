require 'rails_helper'
require 'spec_helper'

describe User do
	describe 'User Model' do
		context 'Create user in our website' do
			it 'should create a user in the database' do
				User.create_user!(:name => 'michael', :email=> 'mkoscak@uiowa.edu', :password => 'testpass', :password_confirmation => 'testpass')
				expect(User.where(:name => "michael").count > 0)
			end
		end
    	#context 'Create User with Facebook' do
	    #  it 'should create a user using facebook if user does not exist' do
	    #    @user2.save!
	    #    expect(User.where(:name => "mock_user", :sesion_token => "mock_token").count > 0)
		#    end
	    #  it 'should return the same user if one exists' do
	    #    user = User.omniauth(mock_auth_hash)
	    #    expect(user).to eq(@user2)
		#    end
	    #end
  	end
end