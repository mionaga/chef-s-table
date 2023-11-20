class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_guest_user, only: [:edit]


  def show
    @end_user = EndUser.find(params[:id])
    hide_sensitive_information unless current_end_user == @end_user
    @recipes = @end_user.recipes
  end

  def edit
    @end_user = EndUser.find(params[:id])
    # byebug
  end

  def update
    end_user = EndUser.find(params[:id])
    if end_user.update(end_user_params) == false
      flash.now[:alert] = 'プロフィールの更新に失敗しました。必須項目を入力してください'
      render :edit
      return
    end
    redirect_to end_user_path(end_user), notice: 'プロフィールの更新に成功しました'
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
    @liked_recipes = Recipe.liked_recipes(current_end_user, params[:page], 12)
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
end
