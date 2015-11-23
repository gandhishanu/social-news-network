class UserMailer < ApplicationMailer
  default from: 'socialnewsnetworkUI@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://thawing-woodland-6329.herokuapp.com/'
    mail(to: @user.email, subject: 'Thank You For Registering')
  end
  
  def forgot_password_email(user)
    @user = user
    #@url = 'http://thawing-woodland-6329.herokuapp.com/'
    @url = 'https://selt-michael-koscak.c9.io/'
    mail(to: @user.email, subject: 'Link to Reset Password')
  end
  
end
