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

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    respond_to do |format|
      format.html {redirect_to back}
      format.js { render 'vote' }
    end
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    respond_to do |format|
      format.html {redirect_to back}
      format.js { render 'vote' }
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :picture)
    end
end
