class ItemsController < ApplicationController
before_filter :authenticate_user!, :only => [:new, :create, :edit, :show, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])

    if @item.save
      flash[:notice] = "Item created"
      redirect_to user_items_path(current_user)
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @item = Item.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @item = Item.find(params[:id])

    if @item.update_attributes(params[:user_id => current_user, :id => @item])
      redirect_to user_items_path(current_user), notice: "Successfully updated item."
    else
      render "edit", flash[:notice] = "Error. Item not updated."
    end
  end

  def show
     @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to user_items_path(current_user), notice: "Successfully deleted item."
  end



end