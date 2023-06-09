require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    user = User.create(name: 'Test User')
    described_class.new(user: user, name: 'Test Recipe', description: 'Test Description', preparation_time: 60,
                        cooking_time: 70, public: true)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
