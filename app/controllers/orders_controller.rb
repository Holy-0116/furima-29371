class OrdersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!, only: [:index]
  before_action :sold_out?, only: [:index, :create]
  def index
    @order = OrderAddress.new
    redirect_to root_path if current_user == @item.user
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      @item = Item.find_by(id: params[:item_id])
      render :index

    end
  end

  private

  def set_item
    @item = Item.find_by(id: params[:item_id])
  end

  def sold_out?
    redirect_to root_path if Order.find_by(item_id: @item)
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :tell).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end

