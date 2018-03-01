class Category < ApplicationRecord

  # --- Associations --- #
  has_many :sub_categories, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :root_category, class_name: 'Category', foreign_key: 'parent_id', optional: true

  has_many :items, inverse_of: :category, dependent: :destroy
  has_many :item_variants, through: :items

  has_many :colors, class_name: 'Property::Color', through: :item_variants
  has_many :brands, class_name: 'Property::Brand', through: :item_variants
  has_many :sizes, class_name: 'Property::Size', through: :item_variants
  has_many :materials, class_name: 'Property::Material', through: :item_variants
end