class StoreRetriever
  attr_reader: :store_id
  def initialize(store_id)
    @store_id = store_id
  end

  def get_store
    service.find_store_hours_by_id(store_id)
  end

  def service
    @service ||= BestBuyStoreRetrievalService.new
  end

  def self.get_store(store_id)
    new(store_id).get_store
  end
end
