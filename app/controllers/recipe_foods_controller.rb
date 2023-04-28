class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]

  def index
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @recipe_foods = RecipeFood.includes(:food).all
  end

  def show
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @recipe_foods = RecipeFood.includes(:food).where(recipe: @recipe)
  end

  def new
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @all_foods = Food.get_all_foods(current_user.id)
    @recipe_food = RecipeFood.new
  end

  def edit
    @user_foods = Food.where(user_id: current_user.id).to_a
    @recipe = Recipe.find_by(id: params[:recipe_id])
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = params[:recipe_id]
    @available_foods = Food.all
    @recipe = Recipe.find_by(id: params[:recipe_id])

    respond_to do |format|
      if @recipe_food.save
        format.html do
          redirect_to recipe_path(@recipe), notice: 'Recipe food was successfully created.'
        end
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @recipe = Recipe.find_by(id: params[:recipe_id])

    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html do
          redirect_to recipe_path(@recipe), notice: 'Recipe food was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @recipe_food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe), notice: 'Recipe food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
