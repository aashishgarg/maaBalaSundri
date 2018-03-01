class User < ApplicationRecord

  # ------------- Devise ------------- #
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # ------------- Associations ------------- #
  has_many :item_pricings, inverse_of: :user, dependent: :destroy
  # has_many :items, through: :item_pricings
  has_many :orders, class_name: 'OrderHeader', inverse_of: :user #, dependent: :destroy(Intentionally commented)
  # has_many :order_items, through: :orders
  has_many :cart_items, inverse_of: :user, dependent: :destroy
end