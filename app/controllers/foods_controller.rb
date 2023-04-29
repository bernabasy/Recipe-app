class FoodsController < ApplicationController
  # before_action :set_recipe, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @all_foods = Food.get_all_foods(current_user.id)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id

    if @food.save
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: "#{@food.name} was successfully deleted"
  end

  def update; end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
