class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @foods = current_user.foods
  end
  def destroy
    @food = Food.find(params[:id])
  end
  private

  def food_params
  end
end
