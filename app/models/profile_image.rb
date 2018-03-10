class ProfileImage < Image

  def image_sizes
    case imageable_type
      when 'Category'
        {menu: '304x238', show: '233x345', stamp: '100x100'}
    end
  end
end