class SearchesController < ApplicationController

  def show
    @search = Item.search(params[:q])
    @items = @search.result
  end


end
