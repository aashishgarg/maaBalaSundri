class AddAvatarToCategories < ActiveRecord::Migration[5.1]
  def self.up
    change_table :categories do |t|
      t.has_attached_file :avatar
      t.text :description
    end
  end

  def self.down
    remove_column :categories, :avatar_file_name
    remove_column :categories, :avatar_content_type
    remove_column :categories, :avatar_file_size
    remove_column :categories, :avatar_updated_at
    remove_column :categories, :description
  end
end
