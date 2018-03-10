ActiveAdmin.register Property::Brand, as: 'Brand' do

  menu label: 'Brands', parent: 'MASTERS'
  config.per_page = 10
  permit_params :name

  before_action :only => :index do
    @skip_sidebar = true
  end

  index do
    selectable_column
    id_column
    column :name
    column 'Total Items' do |property|
      label ItemVariant.where(brand: property).count
    end
    column :created_at do |property|
      time_ago_in_words(property.created_at) + ' ago'
    end
    actions
  end

  controller do
    def create
      all_values = []
      all_values = params[:property_brand][:name].split(',') if params[:property_brand][:name]
      all_values.map!(&:strip)
      if all_values.present?
        all_values.each do |value|
          Property::Brand.create(name: value) unless Property::Brand.where(name: value).take
        end
      end

      redirect_to admin_brands_path
    end

    def update
      all_values = []
      all_values = params[:property_brand][:name].split(',') if params[:property_brand][:name]
      all_values.map!(&:strip)
      if all_values.present?
        all_values.each do |value|
          Property::Brand.create(name: value) unless Property::Brand.where(name: value).take
        end
      end

      redirect_to admin_brands_path
    end
  end
end
