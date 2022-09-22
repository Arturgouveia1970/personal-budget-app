require 'rails_helper'

RSpec.describe Payment, type: :model do
  context 'Write validation tests for payment model' do
    it 'is not valid without a name' do
      first_payment = Payment.create(name: nil, amount: 100)
      expect(first_payment).to_not be_valid
    end

    it 'is not valid without an amount' do
      first_payment = Payment.create(name: 'artur', amount: nil)
      expect(first_payment).to_not be_valid
    end
  end
end
