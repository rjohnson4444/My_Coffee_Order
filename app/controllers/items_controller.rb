class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  private
  def items_params
    
  end
end
