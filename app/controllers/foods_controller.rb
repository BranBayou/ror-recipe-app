class FoodsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /foods or /foods.json
  def index
    @foods = current_user.foods
  end

  # GET /foods/1 or /foods/1.json
  def show; end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit; end

  # POST /foods or /foods.json
  def create
    @food = current_user.foods.build(food_params)

    if @food.save
      redirect_to foods_url, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food = current_user.foods.find(params[:id])
    @food.destroy
    redirect_to foods_url, notice: 'Food was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
