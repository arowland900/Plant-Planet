class PostsController < ApplicationController
  def index
    @users = User.all
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_path(current_user.id)
    else
      redirect_to new_posts_path
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    puts params
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy  
    redirect_to user_path(current_user.id)
  end

  private
  def post_params
    params.require(:post).permit(:image, :description, :title)
  end
end
