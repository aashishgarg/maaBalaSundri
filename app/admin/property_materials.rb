ActiveAdmin.register Property::Material, as: 'Material' do

  menu label: 'All Material Names', parent: 'MASTERS'
  permit_params :name
end
