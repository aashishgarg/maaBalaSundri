class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      t.belongs_to :user
      t.belongs_to :item_variant

      t.timestamps
    end
  end
end
