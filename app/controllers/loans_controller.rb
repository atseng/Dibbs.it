class LoansController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @loan = @item.loans.build
    @loan.owner = @item.user
    @loan.borrower = current_user

    if @loan.save
      redirect_to user_items_path(@loan.owner)
      flash[:notice] = "Dibbs"
      @messenger = TwilioMessenger.new(@loan.owner)
      @messenger.send_text("#{@loan.borrower.name}! Dibbs on #{@item.name}")
    else
      redirect_to user_items_path(@loan.borrower)
      flash[:notice] = "Error. Item unavailable"
    end
  end

  def update
    @item = Item.find(params[:item_id])
    @loan = @item.loans.find(params[:id])

    if @loan.update_attributes(params[:loan])
      flash[:notice] = "Loan updated"
      redirect_to edit_user_path(current_user)
    else
      redirect_to user_items_path(@loan.owner)
      flash[:notice] = "Error. Unable to issue item return"
    end
  end


end
