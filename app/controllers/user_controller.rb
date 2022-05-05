class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @current_user = User.find(params[:id])
  end
end
