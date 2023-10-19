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
end
