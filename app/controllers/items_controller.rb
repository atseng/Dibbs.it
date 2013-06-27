class ItemsController < ApplicationController
before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @user = current_user
    @item = @user.items.new
  end

  def create
    @user = current_user
    @item = @user.items.new(params[:item])

    if @item.save
      flash[:notice] = "Item created"
      redirect_to edit_user_path(current_user)
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @item = current_user.items.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])

    if @item.update_attributes(params[:item])
      redirect_to edit_user_path(current_user), notice: "Successfully updated item."
    else
      render "edit", flash[:notice] = "Error. Item not updated."
    end
  end

  def show
     @item = current_user.items.find(params[:id])
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy

    redirect_to edit_user_path(current_user), notice: "Successfully deleted item."
  end



end
