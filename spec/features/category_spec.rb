require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(name: 'Jojo', email: 'jo@email.com', password: 'password')
    @category = Category.create(name: 'Education', icon: 'https://google.com', author_id: @user.id)

    sign_in @user
  end

  it 'Page should have (Add New Category) link' do
    visit categories_path(@user)

    expect(page).to have_content('CATEGORIES')
  end

  scenario 'Should page have ("Add New Category") Button' do
    visit categories_path(@user)
    first(:link, 'Add New Category').click

    expect(page).to have_button('Add')
  end
end
