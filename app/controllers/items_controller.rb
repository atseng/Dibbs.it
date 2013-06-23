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
    # @item = Item.find(params[:item])
    @item = current_user.items.find(params[:id])
  end

  def show
     @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:item])
    @item.destroy
  end



end
