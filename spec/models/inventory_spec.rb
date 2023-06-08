require 'rails_helper'

RSpec.describe Inventory, type: :model do
  # tests go here
  subject do
    Inventory.new(name: 'Inventory 1', description: 'some description to pass validation', created_at: nil,
                  updated_at: nil, user_id: nil)
  end

  before { subject.save }
  it 'should have a name present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a description present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  describe 'associations' do
    it 'belongs to user' do
      inventory = Inventory.reflect_on_association(:user)
      expect(inventory.macro).to eq(:belongs_to)
    end

    it 'has many inventory foods' do
      inventory = Inventory.reflect_on_association(:inventory_foods)
      expect(inventory.macro).to eq(:has_many)
    end
  end
end
