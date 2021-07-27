class CreateShippingFeeStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_fee_statuses do |t|
      t.string :load_id, null: false

      t.timestamps
    end
  end
end
