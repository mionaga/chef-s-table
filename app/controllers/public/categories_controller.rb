class Public::CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @category = Category.find(params[:category_id]) if params[:category_id]
    @ingredients = @category.ingredients.page(params[:page]).per(4) if @category
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end

