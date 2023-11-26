class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.includes(:recipes).page(params[:page]).per(10)
  end

  def show
    @end_user = EndUser.find(params[:id])
    @recipe_count = @end_user.recipes.count
    @recipes = @end_user.recipes.page(params[:page]).per(5)
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    end_user = EndUser.find(params[:id])
    if end_user.update(end_user_params)
       redirect_to admin_end_user_path(end_user), notice: "顧客情報を更新しました"
    else
       render :edit
    end
  end

  private

  def end_user_params
    params.require(:end_user).permit(:family_name,
                                     :first_name,
                                     :nickname,
                                     :email,
                                     :specialty,
                                     :career_intro,
                                     :bio,
                                     :profile_image,
                                     :is_deleted
                                     )
  end

end
