class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.take
    if user
      session[:session_token] = user.session_token
    else
      flash[:notice] = "Invalid user-id or E-mail."
    end
    redirect_to posts_path
  end

  def create_omniauth
    auth_hash = request.env['omniauth.auth']
   
    if session[:session_token]
      set_current_user
      #puts(@current_user.name)
      # Means our user is signed in. Add the authorization to the user
      User.find(session[:session_token]).add_provider(auth_hash)
      
      redirect_to root_path
    else
      # Log him in or sign him up
      auth = Authorization.find_or_create(auth_hash)
   
      # Create the session
      session[:session_token] = auth.user.session_token
   
      redirect_to root_path
    end
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end
  
  def destroy
    session[:user_id] = nil
    session[:session_token] = nil
    redirect_to root_path
  end
end
