class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :shipping_fee_status
belongs_to :scheduled_delivery
belongs_to :sales_status
belongs_to :prefecture
belongs_to :category

belongs_to :user
has_one    :purchase_record
has_one_attached :image

with_options presence: true do

validates :name
validates :info               
validates :category_id, numericality: { other_than: 1 }         
validates :sales_status_id, numericality: { other_than: 1 }        
validates :shipping_fee_status_id, numericality: { other_than: 1 } 
validates :prefecture_id, numericality: { other_than: 0 } 
validates :scheduled_delivery_id , numericality: { other_than: 1 } 
validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 999999}
validates :price,format: { with: /\A[0-9]+\z/, message: "金額は半角でご入力してください"}
validates :image            
 end
end
