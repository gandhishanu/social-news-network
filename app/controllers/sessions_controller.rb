class SessionsController < ApplicationController

  def new
  end

	def	create	
		user	=	User.find_by_email(params[:user][:email])	
		if	user && user.authenticate( params[:user][:password] )
			if user.email_confirmed
			  puts("LOLOLOLOLOLOLOLOLLOLOLOLOLOLO")
			  session[:session_token]=	user.session_token
			else
			  flash[:warning] = 'Please confirm your email before logging in.'
			end
		else
			flash[:warning]	=	'Invalid	email/password	combination'
		end
		redirect_to root_path
	end

  def create_omniauth
    auth_hash = request.env['omniauth.auth']
    if session[:session_token]
      User.find_by_session_token(session[:session_token]).add_provider(auth_hash)
    else
      auth = Authorization.find_or_create(auth_hash)
      session[:session_token] = auth.session_token
    end
    set_current_user
    redirect_to root_path
  end

  def failure
    flash[:notice] = "Sorry, but you didn't allow access to our app!"
  end

  def destroy
    session[:session_token] = nil
    @current_user = nil
    flash[:notice]=	'You have logged out'	
    redirect_to root_path
  end
end
