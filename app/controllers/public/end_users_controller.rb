class Public::EndUsersController < ApplicationController
  
  
  
  def show
    @end_user = EndUser.find(params[:id])
    hide_sensitive_information unless current_end_user == @end_user
    @recipes = @end_user.recipes
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
end
