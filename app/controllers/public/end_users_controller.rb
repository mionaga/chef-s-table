class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_guest_user, only: [:edit]
  before_action :is_matching_login_end_user, only: [:edit, :update]
  
  def show
    @end_user = EndUser.find(params[:id])
    hide_sensitive_information unless current_end_user == @end_user
    @recipe_count = @end_user.recipes.count
    @recipes = @end_user.recipes.page(params[:page]).per(3)
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end
  
  def update
    end_user = EndUser.find(params[:id])
    end_user.update(end_user_params)
    redirect_to end_user_path(end_user)
  end  

  def index
    @end_users = EndUser.includes(:recipes).page(params[:page]).per(8)

  end

  def check
     @end_user = EndUser.find(current_end_user.id)
  end

  def withdraw
     @end_user = EndUser.find(current_end_user.id)
    #is_deletedカラムをtrueにupdate=退会状態になる
    @end_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  def liked_recipes
    @liked_recipes = Recipe.liked_recipes(current_end_user, params[:page], 8)
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
                                     :profile_image
                                     )
  end

  def hide_sensitive_information
    @end_user.family_name = nil
    @end_user.first_name = nil
  end
  
  def ensure_guest_user
    @end_user = EndUser.find(params[:id])
    if @end_user.guest_user?
      redirect_to end_user_path(current_end_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end 
  
  def is_matching_login_end_user
    end_user = EndUser.find(params[:id])
    unless end_user.id == current_end_user.id
      redirect_to recipes_path
    end
  end
end
