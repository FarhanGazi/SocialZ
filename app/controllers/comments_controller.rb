# Controller to manage all the operations on Comments
class CommentsController < ApplicationController
  # constantine the user to log in before doing any action on this controller 
  before_action :authenticate_user!

  # create an instance of comment by finding the refering post and the owner "user"
  # then respondes back in js
  # so that rails ajax can capture the response and modify the page
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

  # destroies the comment
  # then respondes back in js
  # so that rails ajax can capture the response and modify the page
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.js
    end
  end

  # method that acepts only expected parameters
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end