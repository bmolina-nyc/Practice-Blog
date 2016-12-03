class PostsController < ApplicationController

  def index
    @user = User.find_by(id: params[:user_id])

    if @user
      @posts = @user.posts
    else
      @posts = Post.all
    end
  end

  # need logic here whether its random person or a user
  # start with a new post for a user, assumign there is a user
  def new
    @user = User.find_by(id: params[:user_id])
    @post = @user.posts.build
  end

  def create 
    @user = User.find_by(id: params[:post][:user_id])
    @post = Post.new(post_params)

    if @post.save 
      redirect_to user_posts_path(@user)
    else
      redirect_to new_user_post_path
    end

  end

  private

  def post_params
    params.require(:post).permit(:name, :content, :user_id, :created_at)
  end
end
