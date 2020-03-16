class CommentsController < ApplicationController

  def index
  	@comment = Comment.all
  end

  def show
  	@comment = Comment.find(params[:id])
  end

  def edit
  end

  def new
  	@comment = Comment.new
  end

  def create
  	@comment = current_user.comments.new(comment_params)
  	@comment.save
    @post = @comment.post
    redirect_to @post
  end

  private
  def comment_params
  	params.require(:comment).permit(:content, :post_id )
  end

end
