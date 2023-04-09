class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer :quantity
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
