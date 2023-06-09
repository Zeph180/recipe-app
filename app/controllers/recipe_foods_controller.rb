class RecipeFoodsController < ApplicationController
  def create
    @user = current_user
    # @recipe = RecipeFood.where(recipe_id: params[:recipe_id])
    @recipe = Recipe.find(params[:recipe_id])

    # @recipe = @user.recipes.new(recipe_params);
    @recipe_food = RecipeFood.new(params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id))
    @recipe_food.recipe_id = @recipe.id
    # @recipe_food = RecipeFood.new(recipe_food_params);
    @recipe_food.save ? flash[:notice] = 'RecipeFood saved successfully' : flash[:alert] = 'RecipeFood not saved'
    redirect_to recipe_path(params[:recipe_id])
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe.id), notice: 'foor was successfully deleted' }
      format.json { head :no_content }
    end
  end

  def new
    @user = current_user
    @foods = Food.all
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe_food.quantity = recipe_food_params[:quantity]
    @recipe_food.save
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def set_recipe_food
    @recipe_food = RecipeFood.where(recipe_id: params[:recipe_id], food_id: params[:id]).first
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity).merge(params.slice(:recipe_id).permit(:recipe_id))
  end
end
