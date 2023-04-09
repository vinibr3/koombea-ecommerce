class CreatePaymentStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_statuses do |t|
      t.string :alias
      t.integer :code, unique: true, null: false, index: true

      t.timestamps
    end
  end
end
