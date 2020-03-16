class UsersController < ApplicationController
before_action :authenticate_user!
  def profile
  	@user = User.find(params[:id])
  	@post = current_user.posts
  end

end
