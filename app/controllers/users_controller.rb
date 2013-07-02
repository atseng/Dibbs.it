class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all(params[:id])
  end

  def show
    @users = User.find(params[:id])
  end

  def edit
    @items = current_user.items
  end
end
