require 'rails_helper'

RSpec.describe "Course", type: :request do
  before do
    @vertical = create(:vertical)
    @category = create(:category, vertical: @vertical)
    @course = create(:course, category: @category)
  end

  describe "GET /index" do
    it 'returns a successful response' do
      get "/verticals/#{@vertical.id}/categories/#{@category.id}/courses"
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it 'returns a successful response' do
      get "/verticals/#{@vertical.id}/categories/#{@category.id}/courses/#{@course.id}"
      expect(response).to be_successful
    end
  end
end