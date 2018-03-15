class SlideImage < Image

  def image_sizes
    case imageable.class.name
      when 'Category'
        {show: '730x365#'}
      when 'StaticPageHome'
        {show: '1000x591#', stamp: '276x286#'}
      when 'StaticPageAboutUs'
        {show: '1000x591#'}
    end
  end
end