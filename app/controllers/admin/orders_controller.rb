class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.all
  end

  def show
    @orders = Order.where(status: params[:status].to_i)
  end
end
