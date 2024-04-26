class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment create successfully"
      redirect_to post_path(@post)

    else
      flash[:alert] = "Comment create failed"
      redirect_to post_path(@post)
    end

  end

  def destroy
    @comment = @post.comments.find(params[:id]) # filtro de comentário pelo id
    @comment.destroy # destroy o comentário filtrado
    redirect_to post_path(@post)
  end

  private

  def set_post
      @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
