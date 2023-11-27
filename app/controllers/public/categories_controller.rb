class Public::CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @category = Category.find(params[:category_id]) if params[:category_id]
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end

