class PublicsController < ApplicationController
  def index
    @publics = Recipe.includes(%i[user recipe_foods]).where(public: true)
  end
end
