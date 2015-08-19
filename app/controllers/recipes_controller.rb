class RecipesController < ApplicationController
  # http_basic_authenticate_with name: "mh", password: "secret",
  # except: [:index, :show]
  
  def index 
    @recipes = Recipe.all 
  end 

  def show
    @recipe = Recipe.find(params[:id])
  end 

  def new 
    @recipe = Recipe.new 
    @chefs = Chef.all 
  end 

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef_id = Chef.find_by(email: 'me@audreyli.me').id 

    if @recipe.save
      flash[:success] = "Your recipe is created successfully"
      redirect_to @recipe
    else 
      render 'new'
    end 
  end 

  def edit 
    @recipe = Recipe.find(params[:id])
  end 

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else 
      render 'edit'
    end 
  end
  

  private
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :chef_id, :picture)
    end
end
