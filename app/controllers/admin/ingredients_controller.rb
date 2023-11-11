class Admin::IngredientsController < ApplicationController
  def index
    @ingredients = Ingredients.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end
  
  def update
    @ingredient = Ingredient.find(params[:id])
  end 
  
  private
  
  def ingredient_params
    params.require(:ingredient).permit(:name, :description, :image)
  end  
  
end
