require 'rails_helper'

RSpec.describe "Category", type: :request do
  before do
    @vertical = create(:vertical)
    @category = create(:category, vertical: @vertical)
  end

  describe "GET /index" do
    it 'returns a successful response' do
      get "/verticals/#{@vertical.id}/categories"
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it 'returns a successful response' do
      get "/verticals/#{@vertical.id}/categories/#{@category.id}"
      expect(response).to be_successful
    end
  end
end
