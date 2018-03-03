ActiveAdmin.register Property::Color, as: 'Color' do

  menu label: 'Colors', parent: 'MASTERS'
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
      label ItemVariant.where(color: property).count
    end
    column :created_at do |property|
      time_ago_in_words(property.created_at) + ' ago'
    end
    actions
  end

  controller do
    def create
      all_values = []
      all_values = params[:property_color][:name].split(',') if params[:property_color][:name]
      all_values.map!(&:strip)
      if all_values.present?
        all_values.each do |value|
          Property::Color.create(name: value) unless Property::Color.where(name: value).take
        end
      end

      redirect_to admin_colors_path
    end

    def update
      all_values = []
      all_values = params[:property_color][:name].split(',') if params[:property_color][:name]
      all_values.map!(&:strip)
      if all_values.present?
        all_values.each do |value|
          Property::Color.create(name: value) unless Property::Color.where(name: value).take
        end
      end

      redirect_to admin_colors_path
    end
  end
end
