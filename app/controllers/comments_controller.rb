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

  def update
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_url(@post), notice: "comment updated successfully" }
      else
        format.html { redirec_to post_url(@post), alert: "comment not updated" }
      end
    end

  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
