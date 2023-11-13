class Admin::RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:end_user, :cooking_time, :recipe_ingredients, :steps).page(params[:page]).per(8)
  end

  def show
    @recipe = Recipe.includes(:recipe_ingredients, :steps, :end_user, :cooking_time, :photo_attachment).find(params[:id])
    @post_comment = PostComment.new

  end
  
  private

  def recipe_params
    params.require(:recipe).permit(
      :title, :description, :photo, :cooking_time_id,  :profile_image,
      recipe_ingredients_attributes: [:id, :name, :quantity, :_destroy, :category_id],
      steps_attributes: [:id,:ingredients, :description, :_destroy]
      )
  end
  
end

