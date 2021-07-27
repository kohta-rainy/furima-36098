class CreateScheduledDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduled_deliveries do |t|
      t.string :day_id, null: false

      t.timestamps
    end
  end
end
