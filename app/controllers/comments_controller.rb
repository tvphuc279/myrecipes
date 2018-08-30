class CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      ActionCable.server.broadcast "comments", render(partial: 'comments/comment', object: @comment)
    else
      redirect_to :back
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit(:description)
    end
end
