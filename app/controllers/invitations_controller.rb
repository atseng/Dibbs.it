class InvitationsController < ApplicationController
  before_filter :authenticate

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.sender = current_user
    if @invitation.save
      flash[:notice] = "Thank you, friend invitation sent."
      redirect_to edit_user_path(current_user)
    else
      render :action => 'new'
    end
  end








end
