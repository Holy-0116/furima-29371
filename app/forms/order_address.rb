class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :tell, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :house_number
    validates :tell, format: { with: /\A\d{11}\z/, message: 'Invalid.' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, building_name: building_name, house_number: house_number, tell: tell)
  end
end
