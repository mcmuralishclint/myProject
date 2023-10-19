require 'rails_helper'

RSpec.describe "Verticals", type: :request do
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
    it 'creates a new vertical' do
      post "/verticals/", params: { vertical: { name: "TEST_VERTICAL" } }, as: :json
      expect(response).to be_successful
      expect(response).to have_http_status(:created)
    end

    it 'throws a 422 error if the name is nil' do
      post "/verticals/", params: { vertical: { name: nil } }, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'throws a 422 error if the name is already taken' do
      create(:vertical, name: "TEST_VERTICAL")
      post "/verticals/", params: { vertical: { name: "TEST_VERTICAL" } }, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PUT /update" do
    it 'updates an existing vertical successfully' do
      NEW_VERTICAL_NAME = "TEST_VERTICAL_1"
      vertical = create(:vertical)
      put "/verticals/#{vertical.id}", params: { vertical: { name: NEW_VERTICAL_NAME } }, as: :json
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
      expect(vertical.reload.name).to eq(NEW_VERTICAL_NAME)
    end

    it 'throws a 422 error if the update is not successful' do
      NEW_VERTICAL_NAME = "TEST_VERTICAL_2"
      vertical1 = create(:vertical, name: "TEST_VERTICAL_1")
      vertical2 = create(:vertical, name: "TEST_VERTICAL_2")
      put "/verticals/#{vertical1.id}", params: { vertical: { name: NEW_VERTICAL_NAME } }, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "DELETE /" do
    it 'deletes an existing vertical successfully' do
      vertical = create(:vertical)
      delete "/verticals/#{vertical.id}"
      expect(response).to be_successful
      expect(response).to have_http_status(:no_content)
    end
  end
end
