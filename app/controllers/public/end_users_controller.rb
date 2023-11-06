class Public::EndUsersController < ApplicationController
  
  
  
  def show
    @end_user = EndUser.find(params[:id])
    hide_sensitive_information unless current_end_user == @end_user
  end

  def edit
  end

  def index

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

  private

  def end_user_params
    params.require(:end_user).permit(:family_name, :first_name, :nickname, :email, :specialty, :career_intro, :bio)
  end

  def hide_sensitive_information
    @end_user.email = nil
    @end_user.family_name = nil
    @end_user.first_name = nil
  end
end
