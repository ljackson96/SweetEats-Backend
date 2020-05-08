class RecipesController < ApplicationController
    def index
        recipes = Recipe.all
        render json: recipes, except: [:created_at, :updated_at]
    end

    def show
        recipe = Recipe.find(params[:id])
        render json: recipe
    end
    
    def update
        @recipe = Recipe.find(params[:id])
         @recipe.update(recipe_params)
    end
    

    private

    def recipe_params
        params.require(:recipe).permit(:user_ratings)
      end
end
