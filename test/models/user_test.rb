require "test_helper"

class UserTest < ActiveSupport::TestCase

  # Test di validità
  def setup 
    @user = User.new(roles_mask: "1", email: "user@prova.it", password: "12345678", password_confirmation: "12345678")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email adressed should be unique" do
    duplicate_user = @user.dup 
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should have a minimum length to be valid" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end
  
end
