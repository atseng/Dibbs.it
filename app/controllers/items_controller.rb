class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])

    if @item.save
      flash[:notice] = "Item created"
      redirect_to items_path
    else
      render "new"
    end
  end

end
