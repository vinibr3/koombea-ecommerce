class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.float :total
      t.references :user
      t.integer :payment_status_code, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
