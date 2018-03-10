class StaticPageHome < StaticPage

  # --------- Associations --------- #
  has_many :slide_images, -> {where("type = 'Slide'")}, as: :imageable, dependent: :destroy
  has_many :discount_images, -> {where("type = 'Discount'")}, as: :imageable, dependent: :destroy
end
