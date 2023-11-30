class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: current_user)

    if @like.save
      redirect_to @post, notice: 'Liked the post!'
    else
      redirect_to @post, alert: 'Error liking the post.'
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy

    redirect_to @like.post, notice: 'Unliked the post!'
  end
end
