class LoansController < ApplicationController

  # Users

  # Loan
  #   :state - :loaned, :returned

  # Items
  #   :state -  :available, :unavailable, :queque

  def create
    @item = Item.find(params[:item_id])
    @loan = @item.loans.build
    @loan.owner = @item.user
    @loan.borrower = current_user

    if @loan.save
      redirect_to user_items_path(@loan.owner)
      flash[:notice] = "You got Dibbs Next"
    else
      redirect_to user_items_path(@loan.borrower)
      flash[:notice] = "Error. Item unavailable"
    end
  end




end
