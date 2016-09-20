require 'rails_helper'

RSpec.describe 'Visitor can see all items', type: :feature do
  scenario 'they visit the root and see a heading' do
    visit '/'

    expect(page.status_code).to eq(200)

    within('h1') do
      expect(page).to have_content('Items')
    end
  end
end
