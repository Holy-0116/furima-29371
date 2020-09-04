class ItemsController < ApplicationController
  before_action :get_root, only:[:new]
  def index
    
  end
  
  def new
    @item = Item.new
  end



  private

  def get_root
    unless current_user
      redirect_to '/users/sign_in'
    end
  end

end

