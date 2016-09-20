class BestBuyStoreSearchService
  def initialize
    @conn = Faraday.new('https://api.bestbuy.com')
    @conn.params['format'] = 'json'
    @conn.params['apiKey'] = ENV['best_buy_key']
  end

  def best_buy_store_search(search_query)
    response = @conn.get("https://api.bestbuy.com/v1/stores(area(#{search_query},25))?format=json&show=longName,city,distance,phone,storeType&apiKey=#{ENV['best_buy_key']}")
    require 'pry'; binding.pry
  end
end
