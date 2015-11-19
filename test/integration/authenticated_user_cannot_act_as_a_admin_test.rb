require 'test_helper'

class AuthenticatedUserCannotActAsAAdminTest < ActionDispatch::IntegrationTest
  test "test's that an authenticated user cannot view admin data or change role" do

    logged_in_user

    visit admin_dashboard_index_path

    assert page.has_content?("The page you were looking for doesn't exist.")
  end
end
