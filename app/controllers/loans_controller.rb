class LoansController < ApplicationController

  # Users

  # Loan
  #   :state - :loaned, :returned

  # Items
  #   :state -  :available, :unavailable

  def create
    @item = Item.find(params[:item_id])
    @loan = @item.loans.build
    @loan.owner = current_user

    if @loan.save
      flash[:notice] = "Loan created"
      redirect_to edit_user_path(current_user)
    else
      render "new"
    end
  end



  end
end
