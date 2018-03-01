class CreatePropertyBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :property_brands do |t|
      t.string :name

      t.timestamps
    end
  end
end
