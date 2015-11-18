class UsersController < ApplicationController
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
        flash[:success] = "Welcome #{@user.name}. Your account has been created."
        redirect_to root_path
      else
        flash[:warning] = "Error" 
        redirect_to new_user_path
      end
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end