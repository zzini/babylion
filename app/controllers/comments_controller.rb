class CommentsController < ApplicationController
  before_action :check_authorization!
  def create
    @comment = Comment.new
    @comment.user_id = params[:comment_user_id]
    @comment.post_id = params[:comment_post_id]
    @comment.content = params[:comment_content]
    @comment.save
    redirect_to post_path(@comment.post_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(params[:post_id])
  end
end
