class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post
  
  def create
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.post = @post;
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post.id), status: 303
    else
      @comments = @post.comments
      render '/posts/show', status: 303
    end    
  end

  def destroy
    @comment = Comment.find params[:id]

    if can?(:crud, @comment)
      @comment.destroy
      redirect_to post_path(@post.comment)
    else
      redirect_to root_path, alert: "Not Authorized"
    end

  end
  
  private

  def find_post
    @post = Post.find params[:post_id]
  end    
end
