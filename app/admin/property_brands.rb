ActiveAdmin.register Property::Brand, as: 'Brand' do

  menu label: 'All Brand Names', parent: 'MASTERS'
  permit_params :name
end
