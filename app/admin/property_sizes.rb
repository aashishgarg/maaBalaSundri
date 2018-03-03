ActiveAdmin.register Property::Size, as: 'Size' do

  menu label: 'Sizes', parent: 'MASTERS'
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
      label ItemVariant.where(size: property).count
    end
    column :created_at do |property|
      time_ago_in_words(property.created_at) + ' ago'
    end
  end

  controller do
    def create
      all_values = []
      all_values = params[:property_size][:name].split(',') if params[:property_size][:name]
      all_values.map!(&:strip)
      if all_values.present?
        all_values.each do |value|
          Property::Size.create(name: value) unless Property::Size.where(name: value).take
        end
      end

      redirect_to admin_sizes_path
    end

    def update
      all_values = []
      all_values = params[:property_size][:name].split(',') if params[:property_size][:name]
      all_values.map!(&:strip)
      if all_values.present?
        all_values.each do |value|
          Property::Size.create(name: value) unless Property::Size.where(name: value).take
        end
      end

      redirect_to admin_sizes_path
    end
  end

end
