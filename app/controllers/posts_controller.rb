class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]) # для отображение тэгов
      @comments = Comment.order(:created_at).limit(5)
    else
      @posts = Post.published
      @comments = Comment.order(:created_at).limit(5)
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to @post, success: 'Статья успешно создана'
    else
      render :new, warning: 'Статья не созданна'
    end
  end

  def edit
  end

  def update
    @post.update_attributes(post_params)
    if @post.save
      redirect_to @post, success: 'Статья успешно обновлена'
    else
      render :edit, danger: 'Статья не обновлена'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Статья успешно удалена'
  end



  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :tag_list, :status)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
