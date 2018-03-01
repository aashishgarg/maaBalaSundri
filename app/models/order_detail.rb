class OrderDetail < ApplicationRecord

  # ------------- Associations ------------- #
  belongs_to :order_header, inverse_of: :order_details
  belongs_to :item_variant, inverse_of: :order_details
  has_one :item, through: :item_variant
end
