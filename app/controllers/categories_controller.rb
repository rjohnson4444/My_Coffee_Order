class CategoriesController < ApplicationController

  def show
    byebug
    @category = Category.find(params[:id])
  end

end
