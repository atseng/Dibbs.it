class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @q = User.search(params[:q])
    @users = @q.result(:distinct => true)
  end

  def show
    @users = User.find(params[:id])
  end

  def edit
    @items = current_user.items
  end
end
