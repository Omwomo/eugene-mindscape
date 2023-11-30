require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET /index' do
    let(:user) { create(:user) }

    it 'should render the correct response status' do
      get users_path
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct Template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'renders the correct placeholder text of the body' do
      get users_path
      expect(response.body).to include('Home Page')
    end
  end

  describe 'GET /show' do
    let(:user) { create(:user) } # Create user from factory

    it 'should render the correct response status' do
      get user_path(user)
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct Template' do
      get user_path(user)
      expect(response).to render_template(:show)
    end

    it 'renders the correct placeholder text of the body' do
      get user_path(user)
      expect(response.body).to include('User Profile')
    end
  end
end
