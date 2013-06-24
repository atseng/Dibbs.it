class UsersController < ApplicationController
  def index
    @users = User.all(params[:id])
  end

  def show
  end

  def edit
  end
end
