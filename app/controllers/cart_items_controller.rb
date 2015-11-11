class CartItemsController < ApplicationController

  def index
    @items_in_cart = Item.find(items_id_in_cart)
    @sum = @items_in_cart.map { |item| item.price}.sum
  end

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
