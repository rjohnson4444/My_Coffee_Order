require 'test_helper'

class UnregisteredUserAuthenticationTest < ActionDispatch::IntegrationTest
  def create_user
    User.create(username: "user", password: "password", address: "1111 Maple Rd", city: "Denver", state: "CO", zip: 82020)
  end

  test "unregistered user register's with a password confirmation" do
    visit root_path

    click_link "Create Account"

    fill_in "Username", with: "user"
    fill_in "Password", with: "pw"
    fill_in "Password confirmation", with: "pw"
    fill_in "Address", with: "1111 Maple Rd"
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zip", with: 82020

    click_button "Create Account"

    assert '/dashboard', current_path
    assert page.has_content?("User's Dashboard")
    assert 1, User.all.count
  end

  test "unregistered user cannot register with different password and password confirmation" do
    visit root_path

    click_link "Create Account"
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
    visit root_path

    click_link "Create Account"

    assert new_user_path, current_path
    assert 0, User.all.count

    # save_and_open_page
    fill_in "Username", with: "user"
    fill_in "Password", with: "pw"
    fill_in "Password confirmation", with: "pw"
    fill_in "Address", with: "1111 Maple Rd"
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zip", with: 82020

    click_button "Create Account"

    assert '/dashboard', current_path

    assert page.has_content?("Logged in as User")
    assert page.has_content?("User's Dashboard")
    assert 0, User.all.count
  end

  test "unregistered user can login" do
    create_user
    user = User.find_by(username: 'user')
    visit root_path

    assert page.has_link?("Login")
    click_link "Login"

    assert '/login', current_path

    fill_in "Username", with: "user"
    fill_in "Password", with: "password"

    click_button "Login"

    assert dashboard_path, current_path
    assert page.has_content?("user has logged in
    ")
    assert page.has_content?("Username: user")

    refute page.has_link?("Login")
    assert page.has_link?("Logout")
  end

  test "logged in user can see coffee items" do
    create_category_and_items(1)
    logged_in_user

    visit items_path

    assert page.has_content?("Pour over0")
    assert page.has_content?("Drip0")
    assert page.has_content?("$4.00")

    click_link "Logout"

    assert page.has_content?("Login")
    refute page.has_content?("Logout")
  end
end
