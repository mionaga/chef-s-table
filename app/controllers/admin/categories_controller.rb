class Admin::CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: "カテゴリーを新規作成しました"
    else
      render :index
    end  
  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      redirect_to admin_categories_path, notice: "カテゴリー情報を更新しました"
    else
      render :index
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to request.referer, notice: "カテゴリー情報を削除しました"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
