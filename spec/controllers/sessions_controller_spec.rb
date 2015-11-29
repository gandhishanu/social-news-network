require 'spec_helper'
require 'rails_helper'

describe SessionsController do
    describe 'Log In Without OmniAuth' do
        it 'should call the model method that performs a search' do
          allow(User).to receive(:nil?).and_return(true)
          expect(User).to receive(:find_by_email)
          post :create, :user=>{:email=> "michael-koscak@uiowa.edu",:password=> "123456"}
        end
        #it 'should set a session variable' do
        #  post :create, :user=>{:email=> "michael-koscak@uiowa.edu", :password=>"123456"}
        #  expect(session[:session_token]).to_not equal(nil)
        #end
    end
    
end