class CartItemsController < ApplicationController

  def create
    item = Item.find(params[:id])

  end
end
