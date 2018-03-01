class CreateItemPricings < ActiveRecord::Migration[5.1]
  def change
    create_table :item_pricings do |t|
      t.belongs_to :item_variant
      t.belongs_to :user
      t.decimal :price

      t.timestamps
    end
  end
end
