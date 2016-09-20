class StoresController < ApplicationController
  def show
    @store = StoreRetriever.find_by(params['store_id'])
  end
end
