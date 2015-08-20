class WelcomeController < ApplicationController
  def index
    redirect_to recipes_path if logged_in?
  end
end
