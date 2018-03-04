class PostsController < ApplicationController
  # before_action :check_authorization!
  before_action :authenticate_user!, except: :index

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end


  def create
    @post = Post.new
    @post.user_id = params[:input_user]
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    redirect_to "/posts/show/#{@post.id}"
  end


  def show
    @post = Post.find params[:id]

  end

  def update

    @post = Post.find params[:id]
    @post.user_id = params[:input_user]
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    redirect_to "/posts/show/#{@post.id}"

  end

  def edit
    @post = Post.find params[:id]

  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to '/'
  end
  
  def like_toggle
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    
    if like.nil?
      Like.create(user_id: current_user.id, post_id: params[:post_id])
    else
      like.destroy
    end
    
    redirect_to :back
  end
end
