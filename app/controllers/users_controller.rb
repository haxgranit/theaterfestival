class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def like
    @user = current_user
    @user2 = User.find(params[:id])
    @user.like!(@user2)
    redirect_to :back, notice: "Liked this user successfully!"
  end

  def follow
    @user = current_user
    @user2 = User.find(params[:id])
    @user.follow!(@user2)
    redirect_to :back, notice: "Followed this user successfully!"
  end

  def unlike
    @user = current_user
    @user2 = User.find(params[:id])
    @user.unlike!(@user2)
    redirect_to :back, notice: "Unliked this user successfully!"
  end

  def unfollow
    @user = current_user
    @user2 = User.find(params[:id])
    @user.unfollow!(@user2)
    redirect_to :back, notice: "Unfollowed this user successfully!"
  end

end
