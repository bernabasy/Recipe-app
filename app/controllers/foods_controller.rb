class FoodsController < ApplicationController
  def index
    @all_foods = Food.get_all_foods
  end

  def new
  end
end
