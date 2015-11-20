class UserMailer < ApplicationMailer
  default from: 'socialnewsnetworkUI@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'https://selt-michael-koscak.c9.io/'
    mail(to: @user.email, subject: 'Thank You For Registering')
  end
end
