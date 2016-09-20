require 'rails_helper'
# As a user
# After I have searched a zip code for stores
# When I click the name of a store
# Then my current path should be "/stores/:store_id"
# I should see the store name, store type and address with city, state and zip
# I should see an unordered list of the store hours in the following format:
#   * Mon: 10am-9pm
# * Tue: 10am-9pm
# * Wed: 10am-9pm
# * Thurs: 10am-9pm
# * Fri: 10am-9pm
# * Sat: 10am-9pm
# * Sun: 11am-7pm
RSpec.describe 'User can visit individual stores', type: :feature do
  scenario 'they can click an individual store and see data on that store' do
    VCR.use_cassette('best_buy_store_search#80202') do
      visit '/'

      fill_in 'query', with: '80302'
      click_on 'Locate'
    end

    VCR.use_cassette('best_buy_store_retrieval#2740') do
      click_link 'Best Buy Mobile - Cherry Creek Shopping Center'

      expect(current_path).to eq('/stores/2740')

      expect(page).to have_content('Best Buy Mobile - Cherry Creek Shopping Center')
      expect(page).to have_content('Mobile')
      expect(page).to have_content('3000 East First Ave, Denver')
      expect(page).to have_content('CO, 80206')
      expect(page).to have_content('Mon: 10am-9pm')
      expect(page).to have_content('Tue: 10am-9pm')
      expect(page).to have_content('Wed: 10am-9pm')
      expect(page).to have_content('Thurs: 10am-9pm')
      expect(page).to have_content('Fri: 10am-9pm')
      expect(page).to have_content('Sat: 10am-9pm')
      expect(page).to have_content('Sun: 11am-6pm')
    end
  end
end
