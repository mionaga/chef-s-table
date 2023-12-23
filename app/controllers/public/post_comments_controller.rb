class Public::PostCommentsController < ApplicationController
  before_action :authorize_end_user, only: [:destroy]

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @post_comments = @recipe.post_comments.where(parent_id: nil).order(created_at: :desc)
    @post_comment = PostComment.new
    @post_comment.end_user_id = current_end_user.id
    @parent_id = params[:parent_id]

     #返信コメントの作成
    @post_comment_reply = @recipe.post_comments.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @post_comment = current_end_user.post_comments.new(post_comment_params)
    @post_comment.recipe_id = @recipe.id
    @post_comments = @recipe.post_comments.order(created_at: :desc).where(parent_id: nil)
     #返信コメントの作成
    @post_comment_reply = @recipe.post_comments.new
    if @post_comment.save == false
      flash.now[:notice] = "コメントの投稿に失敗しました"
      return
    end
    flash.now[:notice] = "コメントの投稿に成功しました"

    #通知実装のため記述
    @recipe.create_notification_by(current_end_user, @post_comment)
  end

  def destroy
    #返信フォームに渡しているインスタンス変数の追加
    @recipe = Recipe.find(params[:recipe_id])
    @post_comment_reply = @recipe.post_comments.new
    @post_comments = @recipe.post_comments.order(created_at: :desc).where(parent_id: nil)

  
    PostComment.find(params[:id]).destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :parent_id)
  end
  
  def authorize_end_user
    @post_comment = PostComment.find(params[:id])
  
    unless @post_comment.end_user == current_end_user
      redirect_to recipe_post_comments_path(recipe_id: @post_comment.recipe.id)
    end
  end  
end
