class StoresController < ApplicationController
  def show
    @store = StoreRetriever.get_store(params['store_id'])
  end
end
