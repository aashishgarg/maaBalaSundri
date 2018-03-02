ActiveAdmin.register ItemVariant do
  menu label: 'Item Variants', parent: 'ITEMS'
  permit_params :item_id, :price, :color_id, :size_id, :brand_id, :material_id,
                images_attributes: [:avatar, :id, :_destroy]

  form do |f|
    f.inputs 'Item Form' do
      f.input :item, as: :select2, collection: Item.all.collect {|x| [x.name, x.id]}
      f.input :price
      f.input :color, as: :select2, collection: Property::Color.all.collect {|x| [x.name, x.id]}
      f.input :size, as: :select2, collection: Property::Size.all.collect {|x| [x.name, x.id]}
      f.input :brand, as: :select2, collection: Property::Brand.all.collect {|x| [x.name, x.id]}
      f.input :material, as: :select2, collection: Property::Material.all.collect {|x| [x.name, x.id]}
      f.has_many :images do |p|
        p.input :_destroy, :as => :boolean, :label => "Destroy?" unless p.object.new_record?
        p.input :avatar, :as => :file, :hint => p.object.new_record? ? "" : f.template.image_tag(p.object.avatar.url(:thumb))
      end
    end
    f.actions
  end

  index do
    # selectable_column
    id_column
    column :item do |item_variant|
      label item_variant.item.name
      link_to '('+item_variant.item.sku+') ', admin_item_path(item_variant.item)
    end
    column :price, sortable: true
    column :color
    column :size
    column :brand
    column :material
    column :image do |item_variant|
      image_tag item_variant.images.first.avatar.url(:stamp), class: 'item_image' if item_variant.images.present?
    end
    actions
  end
end
