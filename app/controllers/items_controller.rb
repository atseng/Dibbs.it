class ItemsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @items = @user.items
  end

  def new
    @item = current_user.items.new
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
    @item = current_user.items.find(params[:id])
    unless @item.present?
      flash[:notice] = "Access Denied"
      redirect_to edit_user_path(current_user)
    end
  end

  def update
    @item = current_user.items.find(params[:id])

    if @item.update_attributes(params[:item])
      redirect_to edit_user_path(current_user), notice: "Successfully updated item."
    else
      render "edit", flash[:notice] = "Error. Item not updated."
    end
  end

  def show
     @item = Item.find(params[:id])
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy

    redirect_to edit_user_path(current_user), notice: "Successfully deleted item."
  end



end
