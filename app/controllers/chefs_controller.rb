class ChefsController < ApplicationController
  
  # refactoring 
  # before_action :set_chef, only:[:create, :edit, :update]
  before_action :set_chef, only:[ :edit, :update]
  before_action :require_same_user, only:[:edit, :upate]

  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 3)
  end

  def new 
    @chef = Chef.new
  end

  def create
     @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "You account has been created successfully"
      redirect_to recipes_path 
    else 
      render 'new'
    end 
    
  end

  def edit
    # @chef = Chef.find(params[:id])
  end

  def update
    # @chef = Chef.find(params[:id])
    if @chef.update(chef_params)
      flash[:success] = "Your profile has been updated successfully"
      redirect_to recipes_path #change to show chef page later 
    else 
      render 'edit'
    end 
  end
  
  def show
    @chef = Chef.find(params[:id])
    @recipes = @chef.recipes.paginate(page: params[:page], per_page: 3)
  end

  

  private
    def chef_params
      params.require(:chef).permit(:chefname, :email, :password)
    end

    def set_chef
      @chef = Chef.find(params[:id])
    end
    
    # make sure chef can only access it's own profile
    def require_same_user
      if current_user != @chef 
        flash[:danger] = "You can only edit your own profile"
        redirect_to root_path
      end 
    end

end
