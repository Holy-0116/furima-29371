require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemailと本名とカナ名とpasswordとpassword_confimationと誕生日があれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it '名字が空だと登録できない' do
        @user.name_family = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name family can't be blank")
      end
      it '名前が空だと登録できない' do
        @user.name_first = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first can't be blank")
      end
      it '名字のカナが空だと登録できない' do
        @user.name_family_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name family reading can't be blank")
      end
      it '名前のカナが空だと登録できない' do
        @user.name_first_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first reading can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@を含まないと登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在すると登録できない' do
        @user.save
        test = FactoryBot.build(:user)
        test.email = @user.email
        test.valid?
        expect(test.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが５文字以下だと登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = 'testtest'
        @user.password_confirmation = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid.Include both letters and numbers')
      end
      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = '12345678'
        @user.password_confirmation = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid.Include both letters and numbers')
      end
      it 'passwordとpassword_confirmationが違うと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '誕生日が空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
