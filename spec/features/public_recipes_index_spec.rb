require 'rails_helper'

RSpec.describe 'Public_recipes page', type: :feature do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(name: 'sattar', email: 'sattar@mail.com', password: 'sattar')
    sign_in @user
    @user.confirm

    # Create necessary data before visiting public_recipes_path
    Food.create(name: 'Carrots', measurement_unit: 'kg', price: 40, quantity: 10, user: @user)
    Recipe.create(name: 'Curry', preparation_time: '30', cooking_time: '45', description: 'Delicious curry recipe', public: true,
                  user: @user)

    visit public_recipes_path
  end

  it 'displays the Public_recipes page' do
    expect(page).to have_content('Public Recipes')
  end

  it 'displays the Public recipe name' do
    expect(page).to have_content('Curry')
  end
end
