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
end
