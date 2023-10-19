require 'rails_helper'

RSpec.describe "Verticals", type: :request do
  describe "GET /index" do
    it 'returns a succesful response' do
      get "/verticals/"
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    before do
      @vertical = Vertical.create(id:1, name: "TEST")
    end

    it 'returns a succesful response' do
      get "/verticals/1"
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    it 'creates a new vertical' do
      post "/verticals/", params: { vertical: { name: "TEST" } }, as: :json
      expect(response).to be_successful
      expect(response).to have_http_status(:created)
    end

    it 'throws a 422 error if the name is nil' do
      post "/verticals/", params: {vertical:{name: nil}}, as: :json
      expect(response).to_not be_successful
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'throws a 422 error if the name is already taken' do
      vertical = Vertical.create(name: "TEST_VERTICAL")
      post "/verticals/", params: {vertical:{name: "TEST_VERTICAL"}}, as: :json
      expect(response).to_not be_successful
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PUT /update" do
    it 'updates an existing vertical succesfully' do
      NEW_VERTICAL_NAME = "TEST"
      vertical = Vertical.create(id:1, name: "TEST_VERTICAL")
      put "/verticals/1", params: { vertical: { name: NEW_VERTICAL_NAME } }, as: :json
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
      expect(vertical.reload.name).to eq(NEW_VERTICAL_NAME)
    end

    it 'throws a 422 error if the update is not succesful' do
      NEW_VERTICAL_NAME = "TEST_VERTICAL_2"
      vertical1 = Vertical.create(id:1, name: "TEST_VERTICAL_1")
      vertical12= Vertical.create(id:2, name: "TEST_VERTICAL_2")
      put "/verticals/1", params: { vertical: { name: NEW_VERTICAL_NAME } }, as: :json
      expect(response).to_not be_successful
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "DELETE /" do
    it 'updates an existing vertical succesfully' do
      vertical = Vertical.create(id:1, name: "TEST_VERTICAL")
      delete "/verticals/1"
      expect(response).to be_successful
      expect(response).to have_http_status(:no_content)
    end
  end
end
