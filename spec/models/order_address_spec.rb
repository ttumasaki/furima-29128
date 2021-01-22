require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '商品購入がうまくいく時' do
      it '全ての情報を正しく入力されていれば保存できる' do
        expect(@order_address.valid?).to eq true
      end
      it '建物名の記載がなくても保存できる' do
        @order_address.building_name = ""
        expect(@order_address.valid?).to eq true
      end
    end

    context '商品購入がうまくいかない時' do
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
        @order_address.phone_number = '000000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid.Input half-width number')
      end
      it 'tokenが送信されないと保存できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが存在しないと保存できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが存在しないと保存できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it '都道府県が--以外でないと保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture is not select.Select prefecture")
      end
      it '電話番号が英数混合では保存できない' do
        @order_address.phone_number = 'a111223333'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid.Input half-width number")
      end
    end
  end
end
