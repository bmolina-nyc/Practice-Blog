class UsersController < ApplicationController
  before_action :current_user, only: [:show, :update]
  
  def new
    @user = User.new  # blank item to wrap the form_for around
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      flash[:notice] = "User successfully created"
      redirect_to user_path(@user)

    else
      redirect_to new_user_path # add a validation here later if somebody doesn't enter a name
    end
  end

  def show 
  end



  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation) 
  end

end
