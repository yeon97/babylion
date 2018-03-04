class CommentsController < ApplicationController
  # before_action :check_authorization!
  before_action :authenticate_user!

  def create
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.post_id = params[:comment_post_id]
    @comment.content = params[:comment_content]
    @comment.save
    redirect_to "/posts/show/#{@comment.post_id}"
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to "/posts/show/#{@comment.post_id}"
  end
end
