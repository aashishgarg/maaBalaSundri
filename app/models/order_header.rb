class OrderHeader < ApplicationRecord

  # ------------- Associations ------------- #
  belongs_to :user, inverse_of: :orders
  has_many :order_details, inverse_of: :order_header, dependent: :destroy

end
