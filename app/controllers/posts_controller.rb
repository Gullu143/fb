class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  respond_to :js, :html, :json
  def index
    @user = current_user
  	@post = Post.all
    @comment = Comment.all
  end

  def show
  	@post = Post.find(params[:id])
    @comment = Comment.new
    @user = current_user
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = current_user.posts.new(post_params)
  	if @post.save 
  		redirect_to @post, notice: 'successfully created post.'
  	else
  		redirect_to new_post_path, notice: 'try again'	
  	end
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
  		redirect_to post_path
  	else
  		render 'new'
  	end
  end

  def like
    @post = Post.find(params[:id])
    if params[:format] == 'like'
      @post.liked_by current_user
    elsif params[:format] == 'unlike'
      @post.unliked_by current_user
    end
  end

  private
  def post_params
  	params.require(:post).permit(:image, :description)
  end
end
