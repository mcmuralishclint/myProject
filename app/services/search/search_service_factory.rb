module Search
  class SearchServiceFactory
    def self.build(query, engine: :elasticsearch)
      case engine
      when :elasticsearch
        Search::ElasticServiceInterface.new(query)
      else
        raise "Invalid search engine specified"
      end
    end
  end
end
