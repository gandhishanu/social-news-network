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
		#context 'Create a user using facebook' do
			#it 'should create an authorization and an omniauth user' do
				#Authorization
			#end
		#end
  	end
end