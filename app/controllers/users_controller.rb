class UsersController < ApplicationController

  def index
    @users = User.all(params[:id])
  end

  def show
    @users = User.find(params[:id])
  end

  def edit
  end
end
