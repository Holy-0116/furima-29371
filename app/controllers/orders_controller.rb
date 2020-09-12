class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :sold_out? , only: [:index, :create]
  def index
    @order = OrderAddress.new
    @item = Item.find_by(id: params[:item_id])
    redirect_to root_path if current_user == @item.user
  end

  def create
    @item = Item.find_by(id: params[:item_id])
    @order = OrderAddress.new(token: order_params[:token], postal_code: order_params[:postal_code], prefecture_id: order_params[:prefecture_id], city: order_params[:city], house_number: order_params[:house_number], building_name: order_params[:building_name], tell: order_params[:tell], item_id: order_params[:item_id], user_id: current_user.id)
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

  def sold_out?
    @item = Item.find_by(id: params[:item_id])
   if  Order.find_by(item_id: @item)
    redirect_to "/"
   end
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
