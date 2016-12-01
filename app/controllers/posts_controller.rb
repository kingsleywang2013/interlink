class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = "You have uploaded a post successfully"
      redirect_to home_path
    else
      flash[:danger] = "There is something wrong when posting an update"
      redirect_to home_path
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :picture)
    end
end
