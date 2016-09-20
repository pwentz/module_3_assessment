class SearchController < ApplicationController
  def index
    @stores = StoreFinder.fetch_stores(params['query'])
  end
end
