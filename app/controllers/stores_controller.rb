class StoresController < ApplicationController
  def show
    @store = StoreRetriever.get_store(params['store_id']).first
    require 'pry'; binding.pry
  end
end
