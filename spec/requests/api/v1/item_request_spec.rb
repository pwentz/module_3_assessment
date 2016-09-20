require 'rails_helper'

RSpec.describe 'Request individual item by id', type: :request do
  it 'returns the requested item in json' do
    item_one = FactoryGirl.create(:item)
    get "/api/v1/items/#{item_one.id}.json"

    returned_item = JSON.parse(response.body)

    expect(response).to have_http_status(200)
    expect(response.content_type).to eq('application/json')
    expect(returned_item['name']).to eq(item_one.name)
    expect(returned_item['created_at']).to be_falsey
    expect(returned_item['updated_at']).to be_falsey
  end
end
