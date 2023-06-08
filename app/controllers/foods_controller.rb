class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)

    if @food.save
      flash[:notice] = 'Food added successfully'
      redirect_to user_foods_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to user_foods_path(current_user), notice: 'Food deleted successfully'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end

