class CartItemsController < ApplicationController

  def create
    item = Item.find(params[:id].to_i)
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have added #{item.title}."
    redirect_to items_path
  end

  def show

  end
end
