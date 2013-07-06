class InvitationsController < ApplicationController
   before_filter :authenticate_user!

  def new
   @invitation = Invitation.new
  end

  def create
   @invitation = Invitation.new(params[:invitation])
   @invitation.sender = current_user

    if @invitation.save
      Mailer.invitation(@invitation).deliver
      flash[:notice] = "Your friend invitation has been sent"
      redirect_to users_path
    else
      flash[:notice] = "Unable to send friend invitation. Already registered."
      redirect_to users_path
    end
  end








end
