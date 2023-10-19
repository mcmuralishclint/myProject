module Search
  class SearchServiceInterface
    def initialize(query)
      @query = query
    end

    def search_in_model(model)
      raise NotImplementedError, "Subclasses must implement this method"
    end
  end
end
