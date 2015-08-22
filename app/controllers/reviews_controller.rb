class ReviewsController < ApplicationController

    def create
        @recipe = Recipe.find(params[:recipe_id])
        # @review = @recipe.reviews.create(review_params)
        @review = @recipe.reviews.create(body: params[:body], chef: current_user, recipe: @recipe)


        if @review.valid?
            flash[:success] = "Your comment is posted successfully"
        else 
            flash[:danger] = "Sorry. Try comment again later."
        end 
        redirect_to :back 

    end

    private 
        def review_params
            params.require(:review).permit(:body)
        end
end
