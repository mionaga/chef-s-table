class Public::PostCommentsController < ApplicationController
  
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @post_comments = @recipe.post_comments
    @post_comment = PostComment.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @post_comment = current_end_user.post_comments.new(post_comment_params)
    @post_comment.recipe_id = @recipe.id
    @post_comment.save
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    PostComment.find(params[:id]).destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
