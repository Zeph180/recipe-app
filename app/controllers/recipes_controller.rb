class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes.all
  end

  def create
    @user = current_user
    @recipe = @user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      redirect_to new_recipe_path
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @inventories = current_user.inventories
  end

  def shop_lists
    @foods = RecipeFood.includes(:food).all.where(recipe_id: params[:recipe])
    inv_foods = InventoryFood.includes(:food).all.where(inventory_id: params[:inventory])
    @miss_foods = []
    @foods.each do |food|
      food_in_inv = inv_foods.find { |i| i.food.id == food.food.id }
      if food_in_inv.present? && food_in_inv.quantity < food.quantity
        food_in_inv.quantity = food.quantity - food_in_inv.quantity
        @miss_foods << food_in_inv
      else
        @miss_foods << food
      end
    end
    @recipe = Recipe.find(params[:recipe])
    @inventory = Inventory.find(params[:inventory])
    @inventories = @miss_foods
    sum = 0
    @inventories.each do |miss_food|
      sum += miss_food.quantity * miss_food.food.price
    end
    @total = sum
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
