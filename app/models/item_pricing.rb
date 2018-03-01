class ItemPricing < ApplicationRecord

  # ------------- Associations ------------- #
  belongs_to :item_variant, inverse_of: :item_pricings
  belongs_to :user, inverse_of: :item_pricings
  has_one :category, through: :item
end
