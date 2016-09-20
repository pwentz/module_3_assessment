require 'rails_helper'

RSpec.describe 'Delete individual item by id', type: :request do
  it 'returns a 204 and removes the item from the database' do
    item_one = Item.create(name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, created_at: Time.now)

    delete "/api/v1/items/#{item_one.id}.json"

    expect(response).to have_http_status(204)
    expect(Item.all).to be_empty
  end
end
