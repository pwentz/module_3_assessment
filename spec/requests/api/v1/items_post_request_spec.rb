require 'rails_helper'

RSpec.describe 'Post individual item', type: :request do
  it 'creates the new item and returns it' do
    item_name = Faker::Commerce.product_name
    item_desc = Faker::Lorem.sentence
    item_image = Faker::Avatar.image

    expect{
      post "/api/v1/items.json", { 'item': { 'name': item_name,
                                             'description': item_desc,
                                             'image_url': item_image } }
    }.to change{Item.count}.from(0).to(1)

    returned_item = JSON.parse(response.body)

    expect(response).to have_http_status(200)
    expect(response.content_type).to eq('application/json')
    expect(returned_item['name']).to eq(item_name)
    expect(returned_item['created_at']).to be_falsey
    expect(returned_item['updated_at']).to be_falsey
  end
end
