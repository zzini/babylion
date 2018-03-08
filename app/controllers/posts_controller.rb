class PostsController < ApplicationController
  before_action :check_authorization!

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new
    @post.user_id = params[:input_user]
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.email = current_user.email
    @post.like_count = 0
    @post.save
    redirect_to post_path(@post)
  end

  def show
    @post = Post.find params[:id]
    @comments = Comment.where(post_id: @post.id)
    @like = Like.find_by(user_id: current_user.id, post_id: @post.id)
  end

  def update
    @post = Post.find params[:id]
    @post.user_id = params[:input_user]
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find params[:id]
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to '/'
  end
  
  def like
    @post = Post.find params[:id]
    @post.like_count += 1
    @post.save
    
    @like = Like.new
    @like.post_id = @post.id
    @like.user_id = current_user.id
    @like.save
    
    redirect_to post_path(@post)
  end
  
  def dislike
    @post = Post.find params[:id]
    @like = Like.find_by(post_id: @post.id)
    
    if @post.like_count - 1 >= 0
      @post.like_count -= 1
      @like.destroy
    end
    @post.save
    
    redirect_to post_path(@post)
  end
end
