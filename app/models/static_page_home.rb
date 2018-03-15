class StaticPageHome < StaticPage

  # --------- Associations --------- #
  has_many :slide_images, -> {where("type = 'SlideImage'")}, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :slide_images, allow_destroy: true
  has_many :discount_images, -> {where("type = 'DiscountImage'")}, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :discount_images, allow_destroy: true
end
