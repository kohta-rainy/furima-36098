require 'rails_helper'

RSpec.describe Destination, type: :model do

    describe '商品購入' do
        before do
          user = FactoryBot.create(:user)
          item = FactoryBot.create(:item)
          @order = FactoryBot.build(:destination,user_id: user.id, item_id:item.id)
        end
    
        context '内容に問題ない場合' do
          it 'すべての値が正しく入力されていれば保存できること' do
            expect(@order).to be_valid
          end

          it 'building_nameは空でも保存できること' do
            @order.building_name = ''
            expect(@order).to be_valid
          end
        end
    
        
      end  
    end
