class OrdersController < ApplicationController

  def create
    binding.pry
     @order = Order.new(quantity: params[:quantity] , sum: params[:sum] )
     if @order.save
       redirect_to order_path
     else
     end
  end

  def show
    @orders = current_user.orders
  end

end
