class Admin::ItemsController < Admin::BaseController

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(title: params[:item][:title], description: params[:item][:description], price: params[:item][:price], image: params[:item][:image])
    redirect_to admin_items_path
    #NEEDTO Add validations and an else if an update doesn't save
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image)
  end

end
