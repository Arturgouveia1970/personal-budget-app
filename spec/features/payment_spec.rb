require 'rails_helper'

RSpec.feature 'payments', type: :feature do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(name: 'jojo', email: 'jo@example.com', password: '123456') 
    @category = Category.create(name: 'Education', icon: 'https://google.com', author_id: @user.id)
    @payment = @category.payments.create(name: 'book1', amount: 25, author_id: @user.id)
    sign_in @user
  end

  it 'Page should have name' do
    visit categories_path(@user, @category)
    expect(page).to have_content(@category.name)
  end

  it 'should show correct transaction amount on the correct category page ' do
    visit payments_path(@category)
    expect(page).to have_content(@payment.amount)
  end
end
