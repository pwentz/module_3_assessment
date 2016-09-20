class SearchController < ApplicationController
  def index
    # Included response var since user story wanted top
    # message to display, yet still had to make objects from
    # response['stores']
    @raw_response_data = StoreFinder.where(name: params['query'])
    @stores = Store.create(@raw_response_data['stores'])
  end
end
