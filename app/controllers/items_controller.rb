class ItemsController < ApplicationController
before_filter :authenticate_user!, :only => [:new, :create]

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

  def show
     @item = Item.find(params[:id])
  end

end
