class CreatePropertyColors < ActiveRecord::Migration[5.1]
  def change
    create_table :property_colors do |t|
      t.string :name

      t.timestamps
    end
  end
end
