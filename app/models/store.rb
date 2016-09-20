class Store < OpenStruct

  def self.create_stores(stores)
    stores.map do |store|
      new(store)
    end
  end
end
