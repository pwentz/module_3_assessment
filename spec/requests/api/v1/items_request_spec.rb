require 'rails_helper'

RSpec.describe 'Request all items', type: :request do
  it 'returns all items in json' do
    item_one = Item.create(name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, created_at: Time.now)
    item_two = Item.create(name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, created_at: Time.now)
    get '/api/v1/items.json'

    returned_items = JSON.parse(response.body)

    expect(response).to have_http_status(200)
    expect(response.content_type).to eq('application/json')
    expect(returned_items.first['name']).to eq(item_one.name)
    expect(returned_items.first['created_at']).to be_falsey
    expect(returned_items.first['update_at']).to be_falsey
  end
end
