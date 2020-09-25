class PostsController < ApplicationController

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]) # для отображение тэгов
      @comments = Comment.order(:created_at).limit(5)
    else
      @posts = Post.all
      @comments = Comment.order(:created_at).limit(5)
    end
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
    params.require(:post).permit(:title, :body, :image, :tag_list)
  end

end
