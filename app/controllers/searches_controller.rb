class SearchesController < ApplicationController

  def show
    @q = Item.search(params[:q])
    @items = @q.result(:distinct => true)
  end


end
