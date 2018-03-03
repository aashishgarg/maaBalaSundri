class OrderDetail < ApplicationRecord

  # ------------- Associations ------------- #
  belongs_to :order_header, inverse_of: :order_details
  belongs_to :item_variant, inverse_of: :order_details
  has_one :item, through: :item_variant

  # ----------------- Scopes --------------- #
  scope :today, -> { where('Date(created_at) = (?)', Date.today) }
  scope :week, -> { where('created_at >= (?)', (Date.today - 1.week)) }
  scope :month, -> { where('created_at >= (?)', (Date.today - 1.month)) }
  scope :year, -> { where('created_at >= (?)', (Date.today - 1.year)) }
end
