require 'rails_helper'

RSpec.describe "Category", type: :request do
  include_examples 'skip_authorization'
  before do
    @vertical = create(:vertical)
    @category = create(:category, vertical: @vertical)
  end

  describe "GET /index" do
    it 'returns a successful response' do
      get "/api/v1/verticals/#{@vertical.id}/categories"
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it 'returns a successful response' do
      get "/api/v1/verticals/#{@vertical.id}/categories/#{@category.id}"
      expect(response).to be_successful
    end
  end
end
