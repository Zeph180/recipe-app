require 'rails_helper'
RSpec.describe "Inventories", type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create!(name: 'apple', email: 'gramsy1@example.mail', password: '123456') }
  let(:inventory) { Inventory.create!(name: 'apple', description: 'grams', user: user) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'should successfully request for inventories' do
      get "/users/#{user.id}/inventories"
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'should successfully render index template' do
      get "/users/#{user.id}/inventories"
      expect(response).to render_template(:index)
    end

    it 'check the response body includes correct text' do
      get "/users/#{user.id}/inventories"
      expect(response.body).to include('<h1 class="text-center">All inventories </h1>')
    end
  end

  describe 'GET /show' do
    it 'should successfully request for inventory' do
      get "/users/#{user.id}/inventories/#{inventory.id}"
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'should successfully render show template' do
      get "/users/#{user.id}/inventories/#{inventory.id}"
      expect(response).to render_template(:show)
    end

    
  end

  describe 'GET /new' do
    it 'should successfully request for new inventory form' do
      get "/users/#{user.id}/inventories/new"
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'should successfully render new template' do
      get "/users/#{user.id}/inventories/new"
      expect(response).to render_template(:new)
    end
  end
end
