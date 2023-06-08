require 'rails_helper'

RSpec.describe "InventoryFoods", type: :request do
include Devise::Test::IntegrationHelpers

  let(:user) { User.create!(name: 'apple', email: 'gramsy1@example.mail', password: '123456') }
  let(:inventory) { Inventory.create!(name: 'apple', description: 'grams', user: user) }
  let(:food) { Food.create!(name: 'apple', measurement_unit: 'grams', price: 1, user: user) }
  let(:inventory_food) { InventoryFood.create!(quantity: 1, food: food, inventory: inventory) }

  before do
    sign_in user
  end


  describe 'GET /new' do
    it 'should successfully request for new inventory form' do
      get "/users/#{user.id}/inventories/#{inventory.id}/inventory_foods/new"
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'should successfully render new template' do
      get "/users/#{user.id}/inventories/#{inventory.id}/inventory_foods/new"
      expect(response).to render_template(:new)
    end
  end

end
