class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :prefecture
  has_one :order
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :user
    validates :name, length: { maximum: 40 }
    validates :explanation, presence: { message: "can't be blank" }
    validates :price, numericality: { greater_than: 300, less_than: 9_999_999 }
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
    validates :status_id, numericality: { other_than: 1, message: 'Select' }
    validates :delivery_fee_id, numericality: { other_than: 1, message: 'Select' }
    validates :delivery_day_id, numericality: { other_than: 1, message: 'Select' }
    validates :shipping_origin_id, numericality: { other_than: 1, message: 'Select' }
  end
end
