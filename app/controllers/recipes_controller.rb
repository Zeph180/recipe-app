class RecipesController < ApplicationController
  def index
    @recipe = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new; end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      flash[:notice] = 'recipe was created successfully.'
      redirect_to recipes_path
    else
      flash.now[:alert] = 'Error! recipe was not created.'
      render :new
    end
  end

  def public_recipes
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  private

  def recipe_params
    params.required(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
