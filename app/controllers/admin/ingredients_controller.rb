class Admin::IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.page(params[page]).per(4)
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save == false
      flash[:alert] = "投稿に失敗しました。必須項目を入力してください"
      redirect_to new_admin_ingredient_path
      return
    end  
    redirect_to admin_ingredient_path(@ingredient), notice: "投稿しました"
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params) == false
      flash[:alert] = "更新に失敗しました。必須項目を入力してください"
      redirect_to edit_admin_ingredient_path(@ingredient)
      return
    end  
    redirect_to admin_ingredient_path(@ingredient), notice: "更新に成功しました"
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :description, :image, :category_id, :seasonal_info)
  end

end
