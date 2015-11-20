class UsersController < ApplicationController

  before_filter :set_current_user
    
  def new
  end
  
  def show
   #@current_user = User.find(params[:id])
  end
     
  def create
    if User.exists?({:email => params[:user][:email]})
        flash[:warning] = "Email is already registered"
        redirect_to new_user_path
    else
      user = User.new(user_params)
      if user.valid?
        @user = User.create_user! user_params
        # Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_email(@user).deliver_later
        flash[:success] = "Welcome #{@user.name}. Your account has been created."
        redirect_to root_path
      else
        flash[:warning] = user.errors.full_messages.first
        redirect_to new_user_path
      end
    end
  end
  
  def validate_from_email
    user = User.find_by_id(params[:id])
    if(user.email_confirm_string == params[:email_confirm_string])
      user.update_attribute(:email_confirmed, true)
      session[:session_token] = user.session_token
      flash[:success] = "Thanks for validating your email"
      redirect_to root_path
    else
      flash[:warning] = "Error validating email - please contact an administrator"
      redirect_to login_path
    end
  end
  
  
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end