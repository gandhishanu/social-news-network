require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "send welcome email" do
    arbitrary_password = SecureRandom.urlsafe_base64
    @user = User.create_user! :name => 'test', :email => 'test@gmail.com', :password => arbitrary_password, :password_confirmation => arbitrary_password
        
    welcome_email = UserMailer.welcome_email(@user).deliver_later
 
    assert_equal "Thank You For Registering", welcome_email.subject
    assert_equal 'test@gmail.com', welcome_email.to[0]
  end
end
