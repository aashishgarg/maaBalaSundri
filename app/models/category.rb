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

  # --- Scopes ---- #
  scope :root_categories, -> { where(parent_id: nil) }
  scope :sub_categories, -> { where.not(parent_id: nil) }
  scope :all_categories, -> {}

  def self.grouped
    Category.sub_categories.order(updated_at: :desc).group_by { |category| category.root_category if category.parent_id }
  end

  def self.default
    Category.first.sub_categories.first
  end

  def sub_category?
    not parent_id.nil?
  end
end