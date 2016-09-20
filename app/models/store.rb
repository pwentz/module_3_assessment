class Store
  attr_reader :name,
              :city,
              :distance,
              :phone,
              :type,
              :id

  def initialize(store, id)
    @id = id
    @name = store['longName']
    @city = store['city']
    @distance = store['distance']
    @phone = store['phone']
    @type = store['storeType']
  end

  def self.create_stores(stores)
    store_id = 0
    stores.map do |store|
      new(store, store_id += 1)
    end
  end
end
