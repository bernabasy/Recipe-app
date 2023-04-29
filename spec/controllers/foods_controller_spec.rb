require 'rails_helper'
require_relative './spec_support_helpers'

RSpec.describe FoodsController, type: :system do
  before(:all) do
    user = authenticate_test_user
    @food = Food.first
    @food ||= Food.create(name: 'Salt', measurement_unit: 'gram', price: 1, quantity: 3, user:)
  end

  it 'can see the food index page' do
    authentificate_test_user
    expect(response.body).to have_content('Log Out')
    get :index

    expect(response.body).to have_content(@food.name)
    expect(response.body).to have_content(@food.measurement_unit)
    expect(response.body).to have_content(@food.price)
    expect(response.body).to have_content('Remove')
  end

  it 'Btn add food should navigate to new' do
    authentificate_test_user
    expect(response.body).to have_content('Log Out')
    get :index
    expect(response).to have_http_status(:success)
    expect(response.body).to have_button('Add Food')
    
    post :create, params: { food: { name: 'Pizza', measurement_unit: 'slice', price: 10, quantity: 1, user: user } }
    expect(response).to redirect_to('/foods/new')
  end
end
