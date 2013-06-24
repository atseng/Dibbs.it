class FriendsController < ApplicationController
  def create
    @user = User.find(current_user)
    @friend = User.find(params[:friend_id])
    params[:friendship1] = {:user_id => @user.id, friend_id => @friend.id, :status => 'pending'}
    params[:friendship2] = {:user_id => friend.id, friend.id => @user.id, :status => 'pending'}
    @friendship1 = Friendship.create(params[:friendship1])
    @friendship2 = Friendship.create(params[:friendship2])

    if @friendship1.save && @friendship2.save
      redirect_to user_friends_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end


















end
