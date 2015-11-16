require 'test_helper'

class AdminLogsInTest < ActionDispatch::IntegrationTest
  test "admin can log in" do
    admin = logged_in_admin

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    assert "/admin/dashboard", current_path
    assert page.has_content?("Admin's Dashboard")
  end
end
