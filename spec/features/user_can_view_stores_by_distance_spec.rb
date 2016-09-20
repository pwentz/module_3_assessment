require 'rails_helper'
# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 15 results
# And I should see the long name, city, distance, phone number and store type for each of the 15 results

RSpec.describe 'User can search for stores by distance', type: :feature do
  scenario 'they search via zip code and receive stores as json' do
    VCR.use_cassette('best_buy_store_search#80202') do
      visit '/'

      fill_in 'query', with: '80202'
      click_on 'Locate'

      expect(page).to have_content('17 total stores')

      within('#store-1') do
        expect(page).to have_content('Name: Best Buy Mobile - Cherry Creek Shopping Center')
        expect(page).to have_content('City: Denver')
        expect(page).to have_content('Distance: 3.25 miles')
        expect(page).to have_content('Phone Number: 303-270-9189')
        expect(page).to have_content('Store Type: Mobile')
      end
    end
  end
end
