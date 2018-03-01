class Property::Size < ApplicationRecord

  # --- Associations --- #
  has_many :item_variants #, inverse_of: 'Property::Brand', dependent: :destroy
end
