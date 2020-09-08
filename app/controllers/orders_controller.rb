class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find_by(id: params[:item_id])
  end

end
