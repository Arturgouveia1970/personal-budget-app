require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Write validation tests for category model' do
    it 'is not valid without a name' do
      first_category = Category.create(name: nil, icon: 'icon')
      expect(first_category).to_not be_valid
    end

    it 'is not valid without an icon' do
      first_category = Category.create(name: 'name', icon: nil)
      expect(first_category).to_not be_valid
    end
  end
end
