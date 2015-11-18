class Admin::DashboardController < Admin::BaseController
  def index
    @admin = current_user
  end
end
