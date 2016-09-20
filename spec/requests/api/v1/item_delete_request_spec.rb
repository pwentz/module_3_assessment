require 'rails_helper'

RSpec.describe 'Delete individual item by id', type: :request do
  it 'returns a 204 and removes the item from the database' do
    item_one = FactoryGirl.create(:item)

    expect{
      delete "/api/v1/items/#{item_one.id}.json"
    }.to change{Item.count}.from(1).to(0)

    expect(response).to have_http_status(204)
  end
end
