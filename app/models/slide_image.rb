class SlideImage < Image

  def image_sizes
    case imageable_type
      when 'Category'
        {show: '730x365'}
      when 'StaticPageHome'
        {show: '1000x591'}
      when 'StaticPageAboutUs'
        {show: '1000x591'}
    end
  end
end