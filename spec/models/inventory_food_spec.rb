require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  # tests go here
  subject do
    InventoryFood.new(quantity: 1, created_at: nil,
                      updated_at: nil, inventory_id: nil, food_id: nil)
  end

  before { subject.save }
  it 'should have a quantity present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'should have a quantity  to be greater than 0' do
    subject.quantity = -1
    expect(subject).to_not be_valid
  end

  describe 'associations' do
    it 'belongs to food' do
      inventory_food = InventoryFood.reflect_on_association(:food)
      expect(inventory_food.macro).to eq(:belongs_to)
    end

    it 'belongs to inventory' do
      inventory_food = InventoryFood.reflect_on_association(:inventory)
      expect(inventory_food.macro).to eq(:belongs_to)
    end
  end
end
