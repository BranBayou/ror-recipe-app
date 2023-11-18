require 'rails_helper'

RSpec.feature 'Foods Index Page', type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { FactoryBot.create(:user, confirmed_at: Time.now) } # Confirm the user's email

  before do
    sign_in user
  end

  scenario "displays foods and delete buttons for current user's foods" do
    food1 = FactoryBot.create(:food, user:)
    FactoryBot.create(:food, user:)

    other_user = FactoryBot.create(:user)
    FactoryBot.create(:food, user: other_user)

    visit foods_path

    expect(page).to have_content('Foods')

    expect(page).to have_content(food1.name)
    expect(page).to have_content(food1.measurement_unit)
    expect(page).to have_content("$ #{food1.price}")
    expect(page).to have_button('Delete', count: 2)
  end
end
