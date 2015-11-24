require "order_validator"

class OrdersController < ApplicationController

  def create
    if current_user
      @order = current_user.orders.new(quantity: params[:quantity] , sum: params[:sum])
      OrderValidator.validate(@order, @cart, current_user)
      flash[:order] = "Order was succefully placed"
      redirect_to orders_path
    else
      flash[:login] ="Must Login"
      redirect_to login_path
    end
  end

  def index
    if current_user
      @orders = current_user.orders
    else
      flash[:login] ="Must Login"
      redirect_to login_path
    end
  end

  def show
    if current_user.admin?
      @order = Order.find(params[:id])
    elsif current_user
      @order = current_user.orders.find(params[:id])
    end
  end
end
