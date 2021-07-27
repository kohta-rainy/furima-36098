class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def
   params.require(:item).permit(:image).merge(user_id: current_user.id,)
  end

end
