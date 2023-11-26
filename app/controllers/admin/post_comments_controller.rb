class Admin::PostCommentsController < ApplicationController

  def index
    @post_comments = PostComment.order(created_at: :desc).page(params[:page]).per(10)
    @end_users = EndUser.all
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    redirect_back(fallback_location: admin_post_comments_path)
  end
end
