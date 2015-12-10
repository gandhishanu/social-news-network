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
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  
   test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end
  
  
  test "email should not be too long" do
  @user.email ="a" * 230 + "@example.com"
  assert_not @user.valid?
  end
  
  test "email validation should reject invalid addresses" do
  invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
  invalid_addresses.each do |invalid_address|
  @user.email = invalid_address
  assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
  end
    
  test "email addresses should be unique" do
  duplicate_user = @user.dup
  duplicate_user.email = @user.email.upcase
  @user.save
  assert_not duplicate_user.valid?
  end
    test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
   test "should follow and unfollow a user" do
    michael  = users(:michael)
    archer   = users(:archer)
    assert_not michael.following?(archer)
    michael.follow(archer)
    assert michael.following?(archer)
    assert archer.followers.include?(michael)
    michael.unfollow(archer)
    assert_not michael.following?(archer)

  
    end
end
end 
