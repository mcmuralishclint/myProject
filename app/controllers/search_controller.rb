class SearchController < ApplicationController
  before_action :authorize_request
  def index
    query = params[:q]
    results = search(query)

    render json: { results: results }
  end

  private

  def search(query)
    search_service = Search::SearchServiceFactory.build(query, engine: DEFAULT_SEARCH_DATABASE)
    results = { verticals: [], categories: [], courses: [] }

    results[:verticals] = search_service.search_in_model(Vertical)
    results[:categories] = search_service.search_in_model(Category)
    results[:courses] = search_service.search_in_model(Course)

    results
  end
end
