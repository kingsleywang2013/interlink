class UsersController < ApplicationController

  def home
    @user = current_user
    @post = Post.new
    @posts = Post.all.order('created_at DESC')
  end

  def my_profile
    @profile = current_user.profile
    @posts = current_user.posts
    @post = Post.new
  end

  def my_friends
    @friends = current_user.friends
  end

  def search_friend
    @users = User.search(params[:search_param])
    if @users
      @users = current_user.except_current_user(@users)
      render partial: 'friends/lookup'
    else
      render status: :not_found, nothing: true
    end
  end

  def add_friend
    friend = User.find(params[:friend_id])
    friendship = current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:success] = 'Friend was successfully added.'
      redirect_to my_friends_path
    else
      flash[:error] = 'There was something wrong with adding user as friend'
      redirect_to my_friends_path
    end
  end

end
