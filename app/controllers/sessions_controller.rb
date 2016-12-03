class SessionsController < ApplicationController

  def new 
  end

  def create
    @user = User.find_by(name: params[:name])
    
    if @user
      if @user.authenticate(params[:password])
        flash[:notice] = "#{@user.name} successfully logged in!"
        redirect_to user_path(@user)
      end
    else
      flash[:notice] = "Please Try Again"
      redirect_to new_session_path
    end
  end


end
