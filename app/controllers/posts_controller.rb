class PostsController < ApplicationController
  before_action :set_user

  def index
    # Action to handle https://users/745/posts
    @posts = @user.posts
  end

  def show
    # Action to handle https://users/745/posts/3
    @post = @user.posts.find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
