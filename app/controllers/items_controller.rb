class ItemsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @items = @user.items
  end

  def new
    if current_user == User.find(params[:user_id])
      @item = current_user.items.new
    else
      redirect_to root_path, :alert => "Unauthorized Access"
    end
  end

  def create
    @item = current_user.items.new(params[:item])

    if @item.save
      flash[:notice] = "Item created"
      redirect_to edit_user_path(current_user)
    else
      render "new"
    end
  end

  def edit
    if current_user == User.find(params[:user_id])
      @item = current_user.items.find(params[:id])
    else
      redirect_to root_path, :alert => "Unauthorized Access"
    end
  end

  def update
    if current_user == User.find(params[:user_id])
      @item = current_user.items.find(params[:id])
    else
      redirect_to root_path, :alert => "Unauthorized Access"
    end

    if @item.update_attributes(params[:item])
      redirect_to edit_user_path(current_user), notice: "Successfully updated item."
    else
      render "edit", flash[:notice] = "Error. Item not updated."
    end
  end

  def show
     @user = User.find(params[:user_id])
     @item = @user.items.find(params[:id])
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy

    redirect_to edit_user_path(current_user), notice: "Successfully deleted item."
  end



end
