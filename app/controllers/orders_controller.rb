class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item
  before_action :move_to_index,only: [:create, :index]

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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    
      currency: 'jpy'               
    )
  end

  private

  def order_params
    params.require(:order).permit(:postal_code,:prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

   def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase_record.present? 
   end
 end

