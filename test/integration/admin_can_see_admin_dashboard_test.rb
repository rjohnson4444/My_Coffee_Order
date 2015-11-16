require 'test_helper'

class AdminCanSeeAdminDashboardTest < ActionDispatch::IntegrationTest
  test "admin can view admin dashboard" do
    admin = make_admin

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit '/admin/dashboard'

    assert page.has_content?("Admin Dashboard")
  end

  test "registered user cannot view admin dashboard" do

    logged_in_user
    visit '/admin/dashboard'

    assert page.has_content?("404")
  end

  test "unregistered user cannot view admin dashboard" do
    create_user
    visit '/admin/dashboard'

    assert page.has_content?("404")
  end
end
