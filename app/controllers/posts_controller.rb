class PostsController < ApplicationController

  def index
    @posts = Post.all
    @comments = Comment.order(:created_at).limit(5)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end



  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

end
