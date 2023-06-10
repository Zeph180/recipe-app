require 'rails_helper'

RSpec.describe Food, type: :model do
  # tests go here
  subject do
    Food.new(name: 'appple', measurement_unit: 'grams', price: 1, created_at: nil,
             updated_at: nil, user_id: nil)
  end

  before { subject.save }
  it 'should have a name present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a measurement unit present' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'should have a price present' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'should have a price greater than 0' do
    subject.price = -1
    expect(subject).to_not be_valid
  end

  describe 'associations' do
    it 'has many posts' do
      food = Food.reflect_on_association(:user)
      expect(food.macro).to eq(:belongs_to)
    end
  end
end
