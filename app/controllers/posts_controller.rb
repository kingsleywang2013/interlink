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
      flash[:error] = "There is something wrong with uploading"
      render 'new'
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :picture)
    end
end
