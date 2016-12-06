class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.build(comments_param)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to home_path }
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to home_path }
      format.js
    end
  end

  private

    def comments_param
      params.require(:comment).permit(:content)
    end

end
