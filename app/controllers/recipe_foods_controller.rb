class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /recipe_foods or /recipe_foods.json
  def index
    @recipe_foods = RecipeFood.all
  end

  # GET /recipe_foods/1 or /recipe_foods/1.json
  def show
  end

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
  end

  # GET /recipe_foods/1/edit
  def edit
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @new_recipe = @recipe.recipe_foods.new(recipe_food_params)
    @foods = Food.all

    if @new_recipe.save
      flash[:notice] = 'Ingredient was added successfully.'
      redirect_to recipe_path(@recipe.id)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipe_foods/1 or /recipe_foods/1.json
  def update
    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html { redirect_to recipe_food_url(@recipe_food), notice: "Recipe food was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe_food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    recipe_food = RecipeFood.find(params[:id])
    authorize! :destroy, recipe_food
    recipe = recipe_food.recipe
    recipe_food.destroy
    redirect_to recipe_path(recipe)
    flash[:notice] = 'Ingredient was deleted'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_food
      @recipe_food = RecipeFood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_food_params
      params.require(:recipe_food).permit(:quntity, :recipe_id, :food_id)
    end
end
