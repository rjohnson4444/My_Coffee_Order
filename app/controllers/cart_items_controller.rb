class CartItemsController < ApplicationController

  def index
    @items_in_cart = @cart.drinks
    @total = @cart.sum

  end

  def create
    item = Item.find(params[:id].to_i)
    @cart.add_item(item.id)

    session[:cart] = @cart.contents
    flash[:notice] = "You now have added #{item.title}."
    redirect_to items_path
  end

  def update
    item = Item.find(params[:id].to_i)
    @cart.add_item(item.id)
    redirect_to cart_items_path
  end

  def show

  end

end
