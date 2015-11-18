require 'test_helper'

class AuthenticatedUserCannotActAsAAdminTest < ActionDispatch::IntegrationTest
  test "test's that an authenticated user cannot view admin data or change role" do
    User.create(username:'Jhun', password:'dana', role: 0)

    visit login_path
    fill_in 'Username', with: 'Jhun'
    fill_in 'Password', with: 'dana'
    click_button "Login"

    visit admin_dashboard_index_path
    assert page.has_content?("The page you were looking for doesn't exist.")
  end
end
