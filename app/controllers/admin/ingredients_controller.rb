class Admin::IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.page(params[page]).per(4)
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to admin_ingredient_path(@ingredient), notice: "投稿しました"
    else
      flash notice = "投稿に失敗しました。必須項目を入力してください"
      render new
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
    redirect_to admin_ingredient_path(@ingredient)
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :description, :image, :category_id)
  end

end
