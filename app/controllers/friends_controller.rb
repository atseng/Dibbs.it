class FriendsController < ApplicationController

  def index
    @user = User.find(current_user)
  end

  def new
    @friendship1 = Friendship.new
    @friendship2 = Friendship.new
  end

  def create
    @user = User.find(current_user)
    @friend = User.find(params[:friend_id])
    params[:friendship1] = {:user_id => @user.id, :friend_id => @friend.id, :status => 'requested'}
    params[:friendship2] = {:user_id => @friend.id, :friend_id => @user.id, :status => 'pending'}
    @friendship1 = Friendship.create(params[:friendship1])
    @friendship2 = Friendship.create(params[:friendship2])

    if @friendship1.save && @friendship2.save
      redirect_to user_friendships_path(current_user)
      flash[:notice] = "Friendship Pending."
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(current_user)
    @friend = User.find(params[:id])
    params[:friendship1] = {:user_id => @friend.id, :friend_id => @user.id, :status => 'accepted'}
    params[:friendship2] = {:user_id => @friend.id, :friend_id => @user.id, :status => 'accepted'}
    @friendship1 = Friendship.find(current_user.friendships[0])
    @friendship2 = Friendship.find(@friend.friendships[0])

    if @friendship1.update_attributes(params[:friendship1]) && @friendship2.update_attributes(params[:friendship2])
      flash[:notice] = "Friend request accepted"
      redirect_to user_friendships_path(current_user)
    else
      redirect_to users_path(current_user)
    end
  end

  def destroy
    @user = User.find(current_user)
    @friend = User.find(params[:id])
    params[:friendship1] = {:user_id => @user.id, :friend_id => @friend.id, :status => 'requested'}
    params[:friendship2] = {:user_id => @friend.id, :friend_id => @user.id, :status => 'pending'}

    @friendship1 = Friendship.find(current_user.friendships[0]).destroy
    @friendship2 = Friendship.find(@friend.friendships[0]).destroy
    flash[:notice] = "Friend request removed"
    redirect_to user_friendships_path(current_user)
  end

end
