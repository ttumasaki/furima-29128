require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '全ての情報を正しく入力されていれば保存できる' do
      expect(@order_address).to be_valid
    end

    it '郵便番号が入力されていないと保存できない' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '都道府県が選択されていないと保存できない' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が入力されていないと保存できない' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が入力されていないと保存できない' do
      @order_address.address = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が入力されていないと保存できない' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '郵便番号にはハイフンがないと保存できない' do
      @order_address.postal_code = '4440000'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid.Input half-width number and hyphen')
    end
    it '電話番号にはハイフンが入力されていると保存できない' do
      @order_address.phone_number = '080-0000-0000'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid.Input half-width number')
    end
    it '電話番号が12桁以上だと保存できない' do
      @order_address.phone_number = '0000000000000000'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid.Input half-width number')
    end
    it 'tokenが送信されないと保存できない' do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
