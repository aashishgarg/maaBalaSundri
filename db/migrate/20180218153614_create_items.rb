class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :category, foreign_key: true
      t.text :name
      t.text :description
      t.text :sku
      t.string :status, default: 'open'

      t.timestamps
    end
  end
end
