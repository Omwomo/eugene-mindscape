class UsersController < ApplicationController
  def index; end

  def show
    # Action to handle https://users/745
    @user = User.find(params[:id])
  end
end
