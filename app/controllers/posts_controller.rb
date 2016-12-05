class PostsController < ApplicationController
 before_action :must_be_logged_in
 skip_before_action :must_be_logged_in, only: :index
 before_action :account_owner, only: [:new,:show, :update]

  def index
    @posts = Post.all
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

  def show 
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])
    @post.update(post_params)

    flash[:notice] = "Post Updated"
    redirect_to user_posts_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:name, :content, :user_id)
  end
end
