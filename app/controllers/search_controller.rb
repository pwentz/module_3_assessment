class SearchController < ApplicationController
  def index
    @response = StoreFinder.fetch_stores(params['query'])
    @stores = Store.create_stores(@response['stores'])
  end
end
