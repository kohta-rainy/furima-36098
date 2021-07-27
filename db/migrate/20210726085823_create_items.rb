class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.text       :info,  null: false
      t.string     :category_id,    null: false
      t.string     :sales_status_id,  null: false
      t.string     :shipping_fee_status_id,  null: false
      t.string     :prefecture_id,  null: false
      t.string     :scheduled_delivery_id,  null: false
      t.integer    :price, null: false
      t.references :user,null: false, foreign_key: true

      t.timestamps
    end
  end
end
