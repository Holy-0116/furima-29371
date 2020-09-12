require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    seller = FactoryBot.create(:user)
    buyer = FactoryBot.create(:user)
    item = FactoryBot.build(:item, user_id: seller.id)
    item.image = fixture_file_upload('public/images/test_image.png')
    item.save
    @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: buyer.id)
  sleep 0.1
  end
  
  describe '決済機能' do
    context '決済がうまくいくとき' do
      it 'すべての値が正しく入力されていれば決済できる' do
        expect(@order_address).to be_valid
      end
    end

    context '決済がうまくいかないとき' do
      it 'クレジットカード情報がないと決済できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号の入力がないと決済できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code input correctly')
      end
      it '郵便番号はハイフンがないと決済できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code input correctly')
      end
      it '都道府県が選択されていないと決済できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture Select')
      end
      it '市区町村の入力がないと決済できない' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地の入力がないと決済できない' do
        @order_address.house_number = ""
        @order_address.valid?
      
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号の入力がないと決済できない' do
        @order_address.tell = ""
        @order_address.valid?
       
        expect(@order_address.errors.full_messages).to include("Tell can't be blank", "Tell Invalid.")
      end
    end
  end
end
