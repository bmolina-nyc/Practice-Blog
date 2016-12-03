
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user = (User.find_by(id: params[:id]) || User.new)
  end

  def logged_in?
    current_user.id != nil
  end

  def must_be_logged_in
    flash[:notice] = "You must be logged in!" 
    return redirect_to root_path unless logged_in?
  end
end
