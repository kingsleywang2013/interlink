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

end
