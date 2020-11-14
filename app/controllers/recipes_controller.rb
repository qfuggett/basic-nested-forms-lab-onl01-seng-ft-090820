class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(ingredient_type: '1')
    @recipe.ingredients.build(ingredient_type: '2')
  end

  def create
    Recipe.create(recipe.params)
    redirect_to recipe_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
        :title,
        :quantity
      ]
    )
    end
end
