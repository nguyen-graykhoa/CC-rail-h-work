class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize_user!, only:[:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
   @post = Post.new(post_params)
   @post.user = current_user
   if @post.save
     flash.notice = "Post created successfully!"
     redirect_to post_path(@post.id)
   else
     render :new, status: 303
   end   
  end

  def index
    @posts = Post.order(created_at: :desc)    
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit, status: 303
    end
  end

  def show
    @post = Post.find params[:id]
    @comments = @post.comments
    @comment = Comment.new
  end

  def destroy
    @post.destroy
    redirect_to posts_index_path
  end

  private

  def authorize_user!
    redirect_to root_path, alert: "Not authorized" unless can?(:crud, @post)
  end  

  def find_post
    @post = Post.find params[:id]
  end  

  def post_params
    params.require(:post).permit(:title, :body)  
  end

end
