class ItemsController < ApplicationController
  before_action :get_root, only: [:new]
  before_action :set_item, only: [:show]
  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  private

  def get_root
    redirect_to '/users/sign_in' unless current_user
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :category_id, :status_id, :delivery_fee_id, :delivery_day_id, :prefecture_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find_by(id: params[:id])
  end
end
