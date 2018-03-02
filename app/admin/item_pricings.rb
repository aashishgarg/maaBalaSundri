ActiveAdmin.register ItemPricing do

  menu label: 'Item Pricings', parent: 'ITEMS'
  permit_params :item_variant_id, :user_id, :price

  form do |f|
    f.inputs 'Item Pricing Form' do
      f.input :item_variant, as: :select2, collection:
          ItemVariant.all.collect {|x| [x.name + ' (' + x.color.name + ',' + x.brand.name + ',' + x.size.name + ',' + x.material.name + ')', x.id]}
      f.input :user, as: :select2, collection: User.all.collect {|u| [u.name, u.id]}
      f.input :price
    end
    f.actions
  end
end
