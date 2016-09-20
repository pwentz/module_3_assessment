class StoreRetriever
  attr_reader :store_id
  def initialize(store_id)
    @store_id = store_id
  end

  def get_store
    raw_store_data = service.find_store_hours_by_id(store_id)
    Store.create_stores(raw_store_data)
  end

  def service
    @service ||= BestBuyStoreRetrievalService.new
  end

  def self.get_store(store_id)
    new(store_id).get_store
  end
end
