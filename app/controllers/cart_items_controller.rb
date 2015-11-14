class CartItemsController < ApplicationController

  def index
    @items_in_cart = @cart.drinks
    # @total = @cart.sum
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
    if params[:edit_action] == 'add'
      @cart.add_item(item.id)
      redirect_to cart_items_path
    else
      @cart.minus_item(item.id)
      redirect_to cart_items_path

    end
  end

  def show
  end

  def destroy
  item = Item.find(params[:id].to_i)
   if @cart.contents.delete_if { |item_id,quantity| item_id == params[:id] }
   flash[:delete] = "Successfully removed #{item.title} from your cart"
     redirect_to cart_items_path
    end
  end
end
