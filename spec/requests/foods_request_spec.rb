require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create!(name: 'apple', email: 'gramsy@example.mail', password: '123456') }
  let(:food) { Food.create!(name: 'apple', measurement_unit: 'grams', price: 1, user:) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'should successfully request for posts' do
      get "/users/#{user.id}/foods"
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'should successfully render index template' do
      get "/users/#{user.id}/foods"
      expect(response).to render_template(:index)
    end

    it 'check the response body includes correct text' do
      get "/users/#{user.id}/foods"
      expect(response.body).to include('<h1 class="text-center">All food</h1>')
    end
  end
  describe 'GET /new' do
    it 'should successfully request for new food form' do
      get "/users/#{user.id}/foods/new"
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'should successfully render new template' do
      get "/users/#{user.id}/foods/new"
      expect(response).to render_template(:new)
    end
  end
end
