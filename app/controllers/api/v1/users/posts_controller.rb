module Api
  module V1
    class Users::PostsController < ApplicationController
      # GET /api/v1/users/:user_id/posts
      def index
        @user = User.find(params[:user_id])
        @posts = @user.posts

        render json: @posts
      end
    end
  end
end
