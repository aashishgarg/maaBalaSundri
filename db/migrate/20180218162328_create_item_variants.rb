class CreateItemVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :item_variants do |t|
      t.references :item, foreign_key: true
      t.decimal :price

      # ---------- Properties -------------- #
      t.integer :color_id
      t.integer :brand_id
      t.integer :size_id
      t.integer :material_id

      t.timestamps
    end

    add_index :item_variants, :color_id
    add_index :item_variants, :brand_id
    add_index :item_variants, :size_id
    add_index :item_variants, :material_id
  end
end
