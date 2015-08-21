class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #methods here is available to controllers, not views.so we have to set here 
  #
  helper_method :current_user, :logged_in?
  def current_user
    #make sure it only retrieve from db once 
    @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end

  # !! will tern anything into true or false 
  def logged_in?
      !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform the action"
      # redirect_to :back
        redirect_to recipes_path
    end 
  end

end

