ActiveAdmin.register Organization do

  menu label: 'Organization Details', parent: 'MASTERS'
  permit_params :name, :email, :address, :mobile_number, :phone_number, :about_us, :tag_line, :latitude,
                :longitude, :facebook, :twitter, :linkedin, :google_plus

  config.filters = false

  form do |f|
    f.inputs 'Item Form' do
      f.input :name
      f.input :email
      f.input :address
      f.input :mobile_number
      f.input :phone_number
      f.input :about_us
      f.input :tag_line
      f.input :latitude
      f.input :longitude

      f.input :facebook
      f.input :twitter
      f.input :linkedin
      f.input :google_plus
    end
    f.actions
  end

  index do
    column :name
    column :email
    column :address
    column 'Mobile', :mobile_number
    column 'Phone', :phone_number
    column 'About', :about_us
    column :tag_line
    column :latitude
    column :longitude
    column :social_links
    actions
  end

end
