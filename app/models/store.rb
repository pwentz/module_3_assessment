class Store < OpenStruct
  def self.create(stores)
    stores.map do |store|
      new(store)
    end
  end
end
