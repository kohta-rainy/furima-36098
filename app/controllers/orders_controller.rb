class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index,only: [:create, :index]
  before_action :find_item

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  def order_params
    params.require(:order).permit(:postal_code,:prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    
      currency: 'jpy'               
    )
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user == @item.user
      redirect_to root_path
   else @item.purchase_record.present?
     redirect_to root_path
   end
end
