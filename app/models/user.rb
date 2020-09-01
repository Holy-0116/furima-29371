class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :name_first, format: { with: /\A[ぁ-んァ-ン一-龥]/, message:"is invalid. Input full-width characters."}
    validates :name_family, format: { with: /\A[ぁ-んァ-ン一-龥]/, message:"is invalid. Input full-width characters."} 
    validates :name_first_reading,format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."} 
    validates :name_family_reading,format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."} 
    validates :birthday
  end
end
