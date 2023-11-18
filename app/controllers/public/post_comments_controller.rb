class Public::PostCommentsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @post_comment = current_end_user.post_comments.new(post_comment_params)
    @post_comment.recipe_id = @recipe.id
    @post_comment.save
    # redirect_to recipe_path(recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    PostComment.find(params[:id]).destroy
    # redirect_to recipe_path(params[:recipe_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
