class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :mobile_number
      t.string :phone_number
      t.text :about_us
      t.text :tag_line
      t.decimal :latitude
      t.decimal :longitude
      t.text :social_links

      t.timestamps
    end
  end
end
