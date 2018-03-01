class ItemVariant < ApplicationRecord

  # --- Associations --- #
  belongs_to :color, class_name: 'Property::Color', optional: true#, inverse_of: :item_variants
  belongs_to :brand, class_name: 'Property::Brand', optional: true
  belongs_to :size, class_name: 'Property::Size', optional: true
  belongs_to :material, class_name: 'Property::Material', optional: true

  belongs_to :item, inverse_of: :item_variants
  has_one :category, through: :item
  has_many :item_pricings, inverse_of: :item_variant, dependent: :destroy

  has_many :order_details, inverse_of: :item_variant, dependent: :destroy
  # has_many :orders, class_name: 'OrderHeader', through: :order_details
end
