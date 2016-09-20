class StoreFinder
  attr_reader :search_query
  def initialize(search_query)
    @search_query = search_query
  end

  def fetch_stores
    service.best_buy_store_search(search_query)
  end

  def service
    @service ||= BestBuyStoreSearchService.new
  end

  def self.where(search_query)
    new(search_query[:name]).fetch_stores
  end
end
