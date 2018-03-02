ActiveAdmin.register Item do

  menu label: 'Items', parent: 'ITEMS'
  config.per_page = 10
  actions :all, :except => [:destroy]
  permit_params :name, :category_id, :description, :sku

  # ----------- Custom Form for Item(Edit/New) ------------ #
  form do |f|
    f.inputs 'Item Form' do
      f.input :category, as: :select2, collection: Category.sub_categories.collect { |x| [x.root_category.name+' ('+x.name+')', x.id] }
      # f.has_many :images do |p|
      #   p.input :_destroy, :as => :boolean, :label => "Destroy?" unless p.object.new_record?
      #   p.input :avatar, :as => :file, :hint => p.object.new_record? ? "" : f.template.image_tag(p.object.avatar.url(:thumb))
      # end
      f.input :name
      f.input :description
      f.input :sku
      if controller.action_name == 'new'
        f.input :colors, as: :select2_multiple, collection: Property::Color.all.collect { |x| [x.name, x.id] }, multiple: true
        f.input :sizes, as: :select2_multiple, collection: Property::Size.all.collect { |x| [x.name, x.id] }, multiple: true
        f.input :materials, as: :select2, collection: Property::Material.all.collect { |x| [x.name, x.id] }
        f.input :brands, as: :select2, collection: Property::Brand.all.collect { |x| [x.name, x.id] }
      end
    end
    f.actions
  end

  controller do
    def create
      @item = Item.new(permitted_params[:item])
      params[:item][:color_ids].each do |color_id|
        params[:item][:size_ids].each do |size_id|
          @item.item_variants.build(color_id: color_id,
                                    size_id: size_id,
                                    material_id: params[:item][:material_ids],
                                    brand_id: params[:item][:brand_ids]
          ) unless (color_id == '' || size_id == '')
        end
      end
      @item.save
      redirect_to admin_items_path
    end
  end
end
