class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @current_user = User.includes(:posts).find(params[:id])
  end
end
