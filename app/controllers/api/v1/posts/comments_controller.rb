module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_post

      # GET /api/v1/posts/:post_id/comments
      def index
        comments = @post.comments
        render json: comments
      end

      # POST /api/v1/posts/:post_id/comments
      def create
        @comment = @post.comments.build(comment_params)
        @comment.user = current_user

        if @comment.save
          render json: @comment, status: :created
        else
          render json: { error: 'Failed to create comment' }, status: :unprocessable_entity
        end
      end

      private

      def set_post
        @post = Post.find(params[:post_id])
      end

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
