class CreateSalesStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_statuses do |t|
      t.string :status_id , null: false

      t.timestamps
    end
  end
end
