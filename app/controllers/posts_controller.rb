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

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path, notice: 'Post created!'
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
