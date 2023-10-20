require 'rails_helper'

RSpec.describe "Verticals", type: :request do
  include_examples 'skip_authorization'
  describe "GET /index" do
    it 'returns a successful response' do
      get "/verticals/"
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let(:vertical) { create(:vertical) }

    it 'returns a successful response' do
      get "/verticals/#{vertical.id}"
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    it 'creates nested resource successfully' do
      request_params = JSON.parse(File.read("spec/fixtures/create_resource.json"))
      post '/verticals', params: request_params
      expect(response).to have_http_status(:created)
    end
  end

  describe "POST /update" do
    it 'updates the vertical resource successfully' do
      vertical = create(:vertical)
      category = create(:category, vertical: vertical, id: 1)
      course = create(:course, category: category, id: 1)

      request_params = JSON.parse(File.read("spec/fixtures/update_resource.json"))
      put "/verticals/#{vertical.id}", params: request_params

      expect(response).to have_http_status(:ok)
    end
  end

end
