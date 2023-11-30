class PostsController < ApplicationController
  before_action :set_user

  def index
    @posts = @user.posts
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    puts 'Reached the create action'
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:notice] = 'Post created successfully!'
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private

  def set_user
    @user = current_user
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
