class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

    validates :nickname, presence: { message: "can't be blank" }
    validates :name_first, format: { with: NAME_REGEX, message:"is invalid. Input full-width characters."}
    validates :name_family, format: { with: NAME_REGEX, message:"is invalid. Input full-width characters."} 
    validates :name_first_reading,format: { with: NAME_KANA_REGEX, message: "is invalid. Input full-width katakana characters."} 
    validates :name_family_reading,format: { with: NAME_KANA_REGEX, message: "is invalid. Input full-width katakana characters."} 
    validates :birthday, presence: { message: "can't be blank" }
  end
    validates :password, format: { with: PASSWORD_REGEX, message:"is invalid.Include both letters and numbers"}
  
    has_many :items

end
