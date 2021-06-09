require "test_helper"

class UserTest < ActiveSupport::TestCase

  # Test di validità
  def setup 
    @user = User.new(roles_mask: "1", email: "user@prova.it", password: "12345678")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end
end
