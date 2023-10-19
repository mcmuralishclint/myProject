module Search
  class ElasticServiceInterface < Search::SearchServiceInterface
    def search_in_model(model)
      model.search(query: { match: { name: {query: @query, fuzziness: 1} } }).records.to_a
    end
  end
end
