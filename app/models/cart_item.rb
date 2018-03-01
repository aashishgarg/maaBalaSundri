class CartItem < ApplicationRecord

  # ------------- Associations ------------- #
  belongs_to :user, inverse_of: :cart_items
  belongs_to :item_variant, inverse_of: :cart_items
  has_one :item, through: :item_variant
end
