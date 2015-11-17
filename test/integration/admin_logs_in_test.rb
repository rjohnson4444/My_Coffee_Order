require 'test_helper'

class AdminLogsInTest < ActionDispatch::IntegrationTest
  test "admin can log in" do
    admin = logged_in_admin

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    assert admin_dashboard_index_path, current_path
    assert page.has_content?("Administrator Dashboard")
  end
end
