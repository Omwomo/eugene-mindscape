require 'rails_helper'

RSpec.describe 'HomeController', type: :request do
  describe 'GET /index' do
    it 'should render the correct response status' do
      get home_route_path
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct Template' do
      get home_route_path
      expect(response).to render_template(:index)
    end

    it 'renders the correct placeholder text of the body' do
      get home_route_path
      expect(response.body).to include('Welcome to Eugenes Mindscape Blog')
    end
  end
end
