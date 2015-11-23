class ForgotPasswordController < ApplicationController
    
    def new
    end
    
    def reset_password
      puts("!!!!!!!" + params.to_s)
      @user = User.find_by_id!(params[:id])
      if @user.email_confirm_string == params[:email_confirm_string]
          @current_user = @user
          session[:session_token] = @user.session_token
          render :edit
      else
          flash[:warning] = "Error.  Please resend email and try again"
          redirect_to root_url
      end
    end
    
    def send_email
        @user = User.find_by_email(params[:user][:email])
        if(@user.nil? == false)
            UserMailer.forgot_password_email(@user).deliver_later
            flash[:success] = "An email with instructions to reset your password has been sent."
        else
            flash[:warning] = "Error. Email not found."
        end
        redirect_to root_path
    end
    
    def update
      params[:user][:email] = @current_user.email
      if @current_user.update_attributes(user_params)
        redirect_to root_url, :notice => "Password has been reset!"
      else
        flash[:warning] = "Didn't work"
        redirect_to root_url
      end
    end
    
    private
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    
end
