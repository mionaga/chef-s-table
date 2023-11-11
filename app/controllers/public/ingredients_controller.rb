class Public::IngredientsController < ApplicationController
  def index
     @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end
  
  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :description, :image, :category_id)
  end
  
end
