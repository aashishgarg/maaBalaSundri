ActiveAdmin.register Property::Size, as: 'Size' do

  menu label: 'All Size Names', parent: 'MASTERS'
  permit_params :name

end
