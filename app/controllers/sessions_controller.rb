class SessionsController < ApplicationController

  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    if session[:user_id]
      User.find(session[:user_id]).add_provider(auth_hash)
    else
      auth = Authorization.find_or_create(auth_hash)
      session[:user_id] = auth.user.id
    end
    set_current_user
    redirect_to root_path
  end

  def failure
    flash[:notice] = "Sorry, but you didn't allow access to our app!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
