class Store
  attr_reader :name,
              :city,
              :distance,
              :phone,
              :type,
              :id

  def initialize(store)
    @id = store['storeId']
    @name = store['longName']
    @city = store['city']
    @distance = store['distance']
    @phone = store['phone']
    @type = store['storeType']
  end

  def self.create_stores(stores)
    stores.map do |store|
      new(store)
    end
  end
end
