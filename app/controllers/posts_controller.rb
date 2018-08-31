# Controller to manage all the operations on Posts
class PostsController < ApplicationController
  # common method that sets the post
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :unlike]
  # constantine the user to log in before doing any action on this controller 
  before_action :authenticate_user!

  # get all the posts in DB and puts them in a collection
  def index
    @posts = Post.all.order("created_at DESC")
  end

  # showes the post set before this action
  def show
  end

  # creates a new instance of post refered to the owner "current_user"
  def new
    @post = current_user.posts.new
  end

  # edits the post set before this action
  def edit
  end

  # create the post by saving it in the DB
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # updates the post by saving the changes in the DB
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # destroies the post
  # then respondes back in js
  # so that rails ajax can capture the response and modify the page
  def destroy
    @post.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # put a like on the post
  # then respondes back in js
  # so that rails ajax can capture the response and modify the page
  def like
    @post.liked_by current_user
    respond_to do |format|
      format.js
      format.html { redirect_back fallback_location: root_path }
      format.json { render layout:false }
    end
  end

  # put a dislike on the post
  # then respondes back in js
  # so that rails ajax can capture the response and modify the page
  def unlike
    @post.unliked_by current_user
    respond_to do |format|
      format.js
      format.html { redirect_back fallback_location: root_path }
      format.json { render layout:false }
    end
  end


  private
  # method that sets the post before any avtion
  def set_post
    @post = Post.find(params[:id])
  end

  # method that acepts only expected parameters
  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
end