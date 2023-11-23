class Admin::RecipesController < ApplicationController

  def index
    @recipes = Recipe.includes(:end_user, :cooking_time, :recipe_ingredients, :steps, :tag).all
    if params[:tag_id].present?
      @recipes = @recipes.where(tag_id: params[:tag_id])
    elsif params[:cooking_time_id].present?
      @recipes = @recipes.where(cooking_time_id: params[:cooking_time_id])
    end
    @recipes = @recipes.page(params[:page]).per(6)
  end

  def show
    @recipe = Recipe.includes(:recipe_ingredients, :steps, :end_user, :cooking_time, :photo_attachment).find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to admin_recipes_path
  end


  private

  def recipe_params
    params.require(:recipe).permit(
      :title, :description, :photo, :cooking_time_id,  :profile_image, :tag_id,
      recipe_ingredients_attributes: [:id, :name, :quantity, :_destroy],
      steps_attributes: [:id,:ingredients, :description, :_destroy]
      )
  end

end

