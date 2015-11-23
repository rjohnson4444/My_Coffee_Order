require 'test_helper'

class UnregisteredUserAuthenticationTest < ActionDispatch::IntegrationTest

  test "unregistered user register's with a password confirmation" do

    user_registration

    assert '/dashboard', current_path
    assert page.has_content?("User's Dashboard")
    assert 1, User.all.count
  end

  test "unregistered user cannot register with different password and password confirmation" do
    visit root_path
    click_link "Sign Up"

    assert 0, User.all.count

    fill_in "Username", with: "user"
    fill_in "Password", with: "pw"
    fill_in "Password confirmation", with: "PW"
    click_button "Create Account"

    assert new_user_path, current_path
    assert page.has_content?("Password confirmation doesn't match Password")
    assert 1, User.all.count
  end

  test "unregistered user can register" do

    user_registration

    assert new_user_path, current_path
    assert 0, User.all.count

    assert '/dashboard', current_path

    assert page.has_content?("Logged in as User")
    assert page.has_content?("User's Dashboard")
    assert 0, User.all.count
  end

  test "unregistered user can login" do

    user = logged_in_user

    assert dashboard_path, current_path
    assert page.has_content?("user has logged in")
    assert page.has_content?("Your Address:")

    refute page.has_link?("Login")
    assert page.has_link?("Logout")
    assert page.has_link?("Dashboard")
  end

  test "logged in user can see coffee items" do
    create_category_and_items(1)
    logged_in_user

    visit items_path

    assert page.has_content?("pour over0")
    assert page.has_content?("drip0")
    assert page.has_content?("$4.00")

    click_link "Logout"

    assert page.has_content?("Login")
    refute page.has_content?("Logout")
  end
end
