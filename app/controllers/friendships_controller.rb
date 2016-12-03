class FriendshipsController < ApplicationController

  def destroy
    @friend = User.find(params[:id])
    @friendship = current_user.friendships.where(friend_id: @friend.id).first
    @friendship.destroy
    flash[:info] = "Friend was successfully removed"
    redirect_to my_friends_path
  end

end
