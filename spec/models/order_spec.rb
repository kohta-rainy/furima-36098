require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order,user_id: user.id, item_id:item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order).to be_valid
      end

      it 'building_nameは空でも購入できること' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end
    
    context '内容に問題がある場合' do
      it '郵便番号が空だと購入できないこと' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it '都道府県を選択していないと購入できないこと' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市町村が空だと購入できないこと' do
        @order.municipalities = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")     
      end

      it '番地が空だと購入できないこと' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      
      it '電話番号が空だと購入できないこと' do
        @order.telephone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号が半角数値以外だと保存できないこと' do
        @order.telephone_number = '１１１１１１１１'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number is invalid")
      end

      it '郵便番号が3桁-と4桁以外だと保存できないこと' do
        @order.postal_code = '1111-11111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it 'user_idが空だと購入できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと購入できない' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空だと購入できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it '電話番号が９桁以下では購入できない' do
        @order.telephone_number = '09012345'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number is invalid")
      end

      it '電話番号が１２桁以上では購入できない' do
        @order.telephone_number = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number is invalid")
      end

      

    end   
  end  
end
