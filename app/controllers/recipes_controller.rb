class RecipesController < ApplicationController
  # http_basic_authenticate_with name: "mh", password: "secret",
  # except: [:index, :show]
  # set recipe must be before require_same_user 
  before_action :set_recipe, only: [:edit, :update, :like, :show]
  before_action :require_user, except: [:show, :index, :like]
  before_action :require_user_like, only: [:like]
  before_action :require_same_user, only:[:edit, :upate]
  before_action :admin_user, only:[:destroy]

  def index 
    # @recipes = Recipe.all.sort_by{|likes| likes.thumbs_up_total}.reverse
    @recipes = Recipe.paginate(page: params[:page], per_page: 10)
  end 

  def show
    # @recipe = Recipe.find(params[:id])
  end 

  def new 
    @recipe = Recipe.new 
    @chefs = Chef.all 
  end 

  def create
    @recipe = Recipe.new(recipe_params)
    # @recipe.chef_id = Chef.find_by(email: 'me@audreyli.me').id 
    @recipe.chef = current_user

    if @recipe.save
      flash[:success] = "Your recipe is created successfully"
      redirect_to @recipe
    else 
      render 'new'
    end 
  end 

  def edit 
    # @recipe = Recipe.find(params[:id])
  end 

  def update
    # @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      # redirect_to chef_path(@recipe.chef)
        redirect_to recipe_path(@recipe)
    else 
      render 'edit'
    end 
  end

  def like
    # @recipe = Recipe.find(params[:id])
    like = Like.create(like: params[:like], chef: current_user, recipe: @recipe)
    if like.valid? 
      flash[:success] = "Your like selection was successful"
    else 
      flash[:danger] = "You can only like or dislike once"
    end   
    redirect_to :back
  end

  def destroy 
    Recipe.find(params[:id]).destroy
    flash[:success] = "Recipe deleted"
    redirect_to recipes_path
  end
  

  private
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :chef_id, :picture, :like, style_ids: [], ingredient_ids: [])
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def require_same_user
      if current_user != @recipe.chef and !current_user.admin?
        flash[:danger] = "You can only edit your own Recipe"
        redirect_to root_path
      end 
    end

    def require_user_like
      if !logged_in?
        flash[:danger] = "You must be logged in to perform the action"
          redirect_to :back
      end 
    end

    def admin_user 
      redirect_to recipes_path unless current_user.admin?
    end
end
