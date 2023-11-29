class Public::PostCommentsController < ApplicationController

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @post_comments = @recipe.post_comments
    @post_comment = PostComment.new
    @post_comment.end_user_id = current_end_user.id

     #返信コメントの作成
    @post_comment_reply = @recipe.post_comments.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @post_comment = current_end_user.post_comments.new(post_comment_params)
    @post_comment.recipe_id = @recipe.id
     #返信コメントの作成
    @post_comment_reply = @recipe.post_comments.new
    if @post_comment.save == false
      flash.now[:alert] = "コメントの投稿に失敗しました"
      # render :index
      return
    end
    flash.now[:notice] = "コメントの投稿に成功しました"
    # render :index
  end

  def destroy
    #返信フォームに渡しているインスタンス変数の追加
    @recipe = Recipe.find(params[:recipe_id])
    @post_comment_reply = @recipe.post_comments.new

    @recipe = Recipe.find(params[:recipe_id])
    PostComment.find(params[:id]).destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :parent_id)
  end
end
