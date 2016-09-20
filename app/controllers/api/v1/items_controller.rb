class Api::V1::ItemsController < Api::V1::BaseController
  def index
    items = Item.all
    render json: items, each_serializer: ItemSerializer
  end

  def show
    item = Item.find_by(id: params['id'])
    render json: item, serializer: ItemSerializer
  end

  def destroy
    item = Item.find_by(id: params['id'])
    respond_with item.destroy if item
  end

  def create
    item = Item.new(item_params)
    render json: item, serializer: ItemSerializer if item.save
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end
end
