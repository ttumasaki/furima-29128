require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品の登録' do
    context '出品商品登録ができる時' do
      it '画像、商品名、カテゴリー、商品状態、配送料の負担、発送元の地域、発送までの日数、価格についての情報が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品商品登録ができない時' do
      it '商品名が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空だと登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報が空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態についての情報が空だと登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担についての情報が空だと登録できない' do
        @item.fee_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee burden can't be blank")
      end
      it '発送元の地域についての情報が空だと登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数についての情報が空だと登録できない' do
        @item.day_required_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day required can't be blank")
      end
      it '価格ついての情報が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が300未満だと登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it '価格ぼ範囲が10000000以上だと登録できない' do
        @item.price = 20_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it '販売価格は半角数字ではないと登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
