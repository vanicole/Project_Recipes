require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  # Testo correttezza dei link nella homepage
  test "layout links" do
    get root_path
    assert_template 'recipes/index'
    assert_select "a[href=?]", recipes_path
    assert_select "a[href=?]", new_user_session_path
    assert_select "a[href=?]", new_user_registration_path
  end
end
