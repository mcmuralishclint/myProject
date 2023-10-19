require 'rails_helper'

RSpec.describe "Resource", type: :request do
  describe 'create resource' do
    it 'should create succesfully if the params are valid' do
      params = {
        "vertical": {
          "name": "MyVertical"
        },
        "category": {
          "name": "MyCategory"
        },
        "course": {
          "name": "MyCourse",
          "author": "MyAuthor"
        }
      }

      post '/api/v1/create_resources', params: params
      expect(response).to be_successful
      expect(response).to have_http_status(:created)
    end
  end

  describe 'update resource' do
    it 'should update successfully if the params are valid' do
      vertical = create(:vertical)
      category = create(:category, vertical: vertical)
      course = create(:course, category: category)

      params = {
        "vertical": { "name": "MyVertical1" },
        "category": { "name": "MyCategory1" },
        "course": { "name": "MyCourse1", "author": "MyAuthor1" }
      }

      patch "/api/v1/update_resources/#{vertical.id}", params: params

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

end
