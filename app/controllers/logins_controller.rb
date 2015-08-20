class LoginsController < ApplicationController
 
 def new
  @chef = Chef.new 
 end

#no need to use instance variable here 
 def create
   chef = Chef.find_by(email: params[:email])
   if chef && chef.authenticate(params[:password])
    session[:chef_id] = chef.id 
    flash[:success] = "You are logged in"
    redirect_to recipes_path 

   else 
     flash.now[:danger] = "Your email and password doesn't match"
     render 'new'
   end
 end

 def destroy
   session[:chef_id] = nil 
   flash[:success] = "You have logged out"
   redirect_to root_path
 end

  private
    def chef_params
      params.require(:chef).permit(:email, :password)
    end
end
