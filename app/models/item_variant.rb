class ItemVariant < ApplicationRecord

  # --- Associations --- #
  belongs_to :color, class_name: 'Property::Color', optional: true #, inverse_of: :item_variants
  belongs_to :brand, class_name: 'Property::Brand', optional: true
  belongs_to :size, class_name: 'Property::Size', optional: true
  belongs_to :material, class_name: 'Property::Material', optional: true

  belongs_to :item, inverse_of: :item_variants
  has_one :category, through: :item
  has_many :item_pricings, inverse_of: :item_variant, dependent: :destroy

  has_many :order_details, inverse_of: :item_variant, dependent: :destroy
  # has_many :orders, class_name: 'OrderHeader', through: :order_details

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  # --- Delegations ---- #
  delegate :name, to: :item
  delegate :description, to: :item
  delegate :sku, to: :item
  delegate :status, to: :item

  # --- Callbacks ------ #
  before_create :build_default_image

  private

  def build_default_image
    images.build(avatar: '') unless images.present?
  end
end
