class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.belongs_to :order_header
      t.belongs_to :item_variant
      t.integer :quantity

      t.timestamps
    end
  end
end
