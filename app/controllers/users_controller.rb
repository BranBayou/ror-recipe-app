class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @food = Food.new
    @recipe = Recipe.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @user.find(params[:id]).destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end