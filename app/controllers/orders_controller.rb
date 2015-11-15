class OrdersController < ApplicationController

  def create

     @order = Order.new(quantity: params[:quantity] , sum: params[:sum] )
     if @order.save
       redirect_to orders_path
     else
     end
  end

  def show

    if current_user
      @orders = current_user.orders
      flash[:order] = "Order was succefully placed"
    else
      flash[:login] ="Must Login"
      redirect_to login_path
    end
  end

end
