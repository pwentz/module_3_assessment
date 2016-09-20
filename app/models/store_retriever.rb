class StoreRetriever
  attr_reader :store_id
  def initialize(store_id)
    @store_id = store_id
  end

  def find_by
    raw_store_data = service.find_store_hours_by_id(store_id)
    Store.create(raw_store_data)
  end

  def service
    @service ||= BestBuyStoreRetrievalService.new
  end

  def self.find_by(store_id)
    new(store_id).find_by.first
  end
end
