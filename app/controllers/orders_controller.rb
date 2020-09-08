class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index]
  
  def index
    @order = Order.new
    @item = Item.find_by(id: params[:item_id])
    
    if current_user == @item.user
      redirect_to root_path
    end
  end

end
