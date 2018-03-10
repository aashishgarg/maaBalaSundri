class Image < ApplicationRecord
  # -------- Associations -------- #
  belongs_to :imageable, polymorphic: true
  has_attached_file :avatar,
                    styles: lambda {|attachment| attachment.instance.image_sizes},
                    default_url: '/images/:style/missing.png'

  # -------- Validations --------- #
  validates_attachment_content_type :avatar,
                                    :content_type => %w(image/jpg image/jpeg image/png image/gif)

  def image_sizes
    case imageable_type
      when 'ItemVariant'
        puts '&&&&&&&&&&&&&&&&&&&&&&&&&&&'
        puts '&&&&&&&&&&&&&&&&&&&&&&&&&&&'
        puts '&&&&&&&&&&&&&&&&&&&&&&&&&&&'
        {index: '255x249', show: '403x472', stamp: '90x105'}
    end
  end
end
