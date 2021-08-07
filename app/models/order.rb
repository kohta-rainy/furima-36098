class Order
    include ActiveModel::Model
    attr_accessor :token,:postal_code,:prefecture_id,:municipalities,:address,:building_name,:telephone_number,:item_id,:user_id

    with_options presence: true do
    validates :postal_code,      format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id
    validates :municipalities
    validates :address
    validates :telephone_number, format: { with: /\A[0-9]+\z/}
    validates :item_id
    validates :user_id
    validates :token
    end  

    def save
     purchase_record = PurchaseRecord.create(item_id: item_id, user_id:user_id)
     Destination.create(purchase_record_id:purchase_record.id,postal_code: postal_code, prefectures_id:prefecture_id, municipalities:municipalities, address:address, building_name:building_name, telephone_number:telephone_number)
    end
  end