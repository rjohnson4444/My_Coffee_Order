require 'test_helper'

class UnregisteredUserAuthenticationTest < ActionDispatch::IntegrationTest
  def logged_in_user
    User.create(username: "user", password: "password")
    visit '/login'
    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  test "unregistered user can register" do
    visit '/'

    click_link "Create Account"

    assert new_user_path, current_path

    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert '/dashboard', current_path
    assert page.has_content?("Logged in as User")
  end

  test "unregistered user can login" do
    skip
    visit '/'

    assert page.has_link?("Login")
    click_link "Login"

    assert '/login', current_path

    fill_in "Username", with: "Coffee"
    fill_in "Password", with: "password"

    click_button "Login"

    assert user_path, current_path
    assert page.has_content?("Logged in as Coffee")
    assert page.has_content?("Username: Coffee")

    refute page.has_link?("Login")
    assert page.has_link?("Logout")
  end

  test "logged in user can see coffee items" do
    skip
    create_category_and_items(1)
    logged_in_user

    visit items_path

    assert page.has_content?("pour over1")
    assert page.has_content?("drip1")
    assert page.has_content?("$4.00")
    assert page.has_content?("quantity:1")

    click_link "Logout"

    assert page.has_content?("Login")
    refute page.has_content?("Logout")
  end
end
