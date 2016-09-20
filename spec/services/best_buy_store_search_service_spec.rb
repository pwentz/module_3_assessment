require 'rails_helper'

RSpec.describe BestBuyStoreSearchService, type: :service do
  before(:each) do
    @service = BestBuyStoreSearchService.new
  end

  it 'returns 15 results when searching by zip code' do
    VCR.use_cassette('best_buy_service_search#80202') do
      response = @service.best_buy_store_search('80202')
      stores = response['stores']
      example_store = stores.first

      expect(response['total']).to eq(17)
      expect(stores.length).to eq(15)
      expect(example_store['longName']).to eq('Best Buy Mobile - Cherry Creek Shopping Center')
      expect(example_store['city']).to eq('Denver')
      expect(example_store['distance']).to eq(3.25)
      expect(example_store['phone']).to eq('303-270-9189')
      expect(example_store['storeType']).to eq('Mobile')
    end
  end
end
