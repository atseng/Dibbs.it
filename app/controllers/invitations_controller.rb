class InvitationsController < ApplicationController
   before_filter :authenticate_user!

  def new
   @invitation = current_user.sent_invitations.new
  end

  def create
   @invitation = Invitation.new(params[:invitation])
   @invitation.sender_id = current_user
   @user = @invitation.sender_id

    if @invitation.save
      Mailer.invitation(@invitation).deliver
      flash[:notice] = "Your friend invitation has been sent"
      redirect_to users_path
    else
      render :action => 'new'
    end
  end








end
