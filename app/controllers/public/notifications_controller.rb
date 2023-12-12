class Public::NotificationsController < ApplicationController
  def index
    @notifications = current_end_user.passive_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
    @notifications.each do |notification|
      if notification.action == 'reply_comment'
        # recipeに関連づけられたコメントで、parent_idを持っているコメントを検索
        @reply_comment = PostComment.find_by(recipe_id: notification.recipe_id, parent_id: notification.reply_comment.id)
      end
    end  
  end

  def destroy
    #通知を全削除
    @notifications = current_end_user.passive_notifications.destroy_all
    redirect_to notifications_path
  end
end
