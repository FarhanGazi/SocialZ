class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    respond_to do |format|
      if current_user.comments << @comment
        format.js
      else
        format.html { render 'post/show' }
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.js
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end