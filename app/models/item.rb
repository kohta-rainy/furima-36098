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
validates :image 
validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end

with_options numericality: { other_than:1 } do
validates :category_id         
validates :sales_status_id       
validates :shipping_fee_status_id 
validates :prefecture_id
validates :scheduled_delivery_id 
end            
end
