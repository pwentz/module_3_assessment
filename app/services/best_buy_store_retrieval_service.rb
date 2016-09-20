class BestBuyStoreRetrievalService
  def initialize
    @conn = Faraday.new('https://api.bestbuy.com/v1/stores')
  end

  def find_store_hours_by_id(store_id)
    response = @conn.get("https://api.bestbuy.com/v1/stores(storeId=#{store_id})?format=json&show=longName,storeType,address,city,postalCode,region,hoursAmPm&apiKey=#{ENV['best_buy_key']}")
    JSON.parse(response.body)['stores']
  end
end
