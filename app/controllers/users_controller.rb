class UsersController < ApplicationController

  def home
    @user = current_user
    @post = Post.new
    @posts = Post.all
  end

end
