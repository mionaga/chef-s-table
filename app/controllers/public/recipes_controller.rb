class Public::RecipesController < ApplicationController
  before_action :authorize_end_user, only: [:edit, :update]

  def index
    @recipes = Recipe.includes(:end_user, :cooking_time, :recipe_ingredients, :steps, :tag)
                     .order(created_at: :desc)
    if params[:tag_id].present?
      @recipes = @recipes.where(tag_id: params[:tag_id])
    elsif params[:cooking_time_id].present?
      @recipes = @recipes.where(cooking_time_id: params[:cooking_time_id])
    end
    @recipes = @recipes.page(params[:page]).per(9)
  end

  def new
    @recipe = Recipe.new
    @recipe.recipe_ingredients.build #画面で使うための空の食材オブ時ジェクト
    @recipe.steps.build #画面で使うための空のstepsオブジェクト
  end

 def create
   @recipe = Recipe.new(recipe_params)
   @recipe.end_user_id = current_end_user.id
   if @recipe.save
     redirect_to recipe_path(@recipe), notice: '投稿に成功しました'
   else
     render :new
   end
 end


  def show
    @recipe = Recipe.includes(:recipe_ingredients, :steps, :end_user, :cooking_time, :photo_attachment).find(params[:id])
    @post_comment = PostComment.new

  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params) == false
      flash.now[:alert] = 'レシピの更新に失敗しました。必須項目を入力してください'
      render :edit
      return
    end
    redirect_to @recipe, notice: 'レシピの更新に成功しました'
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title, :description, :photo, :cooking_time_id, :tag_id,
      recipe_ingredients_attributes: [:id, :name, :quantity, :_destroy, :category_id],
      steps_attributes: [:id,:ingredients, :description, :_destroy]
      )
  end

  def authorize_end_user
    @recipe = Recipe.find(params[:id])
    unless @recipe.end_user == current_end_user
      flash[:alert] = '他のユーザーのレシピは編集できません。'
      redirect_to recipes_path
    end
  end
end
