class Public::RecipesController < ApplicationController
  def index
  end

  def new
    @recipe = Recipe.new
    @recipe.recipe_ingredients.build #画面で使うための空の食材オブ時ジェクト
    @recipe.steps.build #画面で使うための空のstepsオブジェクト
  end

 def create
   @recipe = Recipe.new(recipe_params)
   if @recipe.save
     redirect_to recipe_path(@recipe), notice: '投稿しました'
   else
     flash.now[:alert] = '投稿に失敗しました。必須項目を入力してください'
     render :new
   end
 end


  def show
  end

  def edit
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title, :description, :photo,
      recipe_ingredients_attributes: [:id, :name, :quantity, :_destroy],
      steps_attributes: [:id,:ingredients, :_destroy]
      )
  end
end
