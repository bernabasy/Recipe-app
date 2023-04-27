class PublicRecipesController < ApplicationController
    before_action :authenticate_user!

    def index
      @public_recipes = Recipe.includes(:recipe_foods, :user).where(public: true).order(created_at: :desc)
    end
  end
