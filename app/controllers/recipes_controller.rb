class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipes = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @recipe.find(params[:id]).destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
