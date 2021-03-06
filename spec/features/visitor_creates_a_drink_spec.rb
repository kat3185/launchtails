require 'rails_helper'

feature 'visitor creates drink', %Q{
  As a visitor
  I want to create a drink
  So I can share its deliciousness with others
} do
  # Acceptance Criteria:
  #
  # * I must specify a unique title of 5 characters or more
  # * I can optionally specify a description
  # * If I don't enter a valid title, I should be presented with an error message
  # * If I successfully add the drink, I should see it in the listing of drinks

  scenario 'add a valid drink' do
    category = FactoryGirl.create(:category)
    drink_title = 'Pumpkin Martinis'
    visit new_drink_path

    fill_in 'Title', with: drink_title
    fill_in 'Description', with: 'Likely the best martini you will ever have. A Thanksgiving must.'
    check 'Featured'
    select category.name, from: 'Category'
    choose 'Medium'

    click_button 'Add Drink'

    expect(page).to have_content('Drink added.')
    expect(page).to have_content(drink_title)
  end

  scenario 'attempt to add an invalid drink' do
    visit new_drink_path

    click_button 'Add Drink'

    expect(page).to have_content("can't be blank")
  end
end
