require 'rails_helper'

RSpec.describe BestBuyStoreRetrievalService, type: :service do
  before(:each) do
    @service = BestBuyStoreRetrievalService.new
  end

  it 'returns hours for store when given storeId' do
    VCR.use_cassette('best_buy_store_retrieval#2740') do
      store = @service.find_store_hours_by_id('2740').first

      expect(store['longName']).to eq('Best Buy Mobile - Cherry Creek Shopping Center')
      expect(store['storeType']).to eq('Mobile')
      expect(store['address']).to eq('3000 East First Ave')
      expect(store['city']).to eq('Denver')
      expect(store['region']).to eq('CO')
      expect(store['postalCode']).to eq('80206')
      expect(
        store['hoursAmPm']
      ).to eq('Mon: 10am-9pm; Tue: 10am-9pm; Wed: 10am-9pm; Thurs: 10am-9pm; Fri: 10am-9pm; Sat: 10am-9pm; Sun: 11am-6pm')
    end
  end
end
