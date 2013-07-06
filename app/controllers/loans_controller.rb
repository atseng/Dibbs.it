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


  def edit
    @item = Item.find(params[:item_id])
    @loan = @item.loans.find(params[:id])
    @loan.loan

    respond_to do |format|
      if @loan.save
         format.html { redirect_to(@loan, :notice => 'Item loaned.') }
         format.js
      else
        format.html { render :nothing => true }
        format.js
      end
    end
  end

  def update
    @item = Item.find(params[:item_id])
    @loan = @item.loans.find(params[:id])

    respond_to do |format|
      if @loan.update_attributes.(params[:id])
        flash[:notice] = "Item Return"
        @loan.return
        @messenger = TwilioMessenger.new(@loan.borrower)
        @messenger.send_text("Hey #{@loan.borrower.name}. I need that #{@item.name} back. Get it back to me by end of the week.")
        format.html { redirect_to user_items_path(current_user, :notice => 'Issue Item Return')}
      else
        redirect_to user_items_path(@loan.owner)
        flash[:notice] = "Error. Unable to issue item return"
        format.html { render :nothing => true }
        format.js
      end
    end
  end


end
