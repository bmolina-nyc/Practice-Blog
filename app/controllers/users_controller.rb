class UsersController < ApplicationController
  before_action :current_user
  before_action :must_be_logged_in
  skip_before_action :must_be_logged_in, only: [:new, :show, :create, :update]
  
  def new
    # don't need the variable here - i've scoped it in the application controller 
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      flash[:notice] = "#{@user.name} successfully created"
      redirect_to user_path(@user)

    else
      redirect_to new_user_path # add a validation here later if somebody doesn't enter a name
    end
  end

  def show 
    @user = User.find_by(id: params[:id])
  end

  def update 
     # don't need the variable here - i've scoped it in the application controller 
  end


  private

  def user_params
    params.require(:user).permit(:name, :id, :password, :password_confirmation) 
  end

end
