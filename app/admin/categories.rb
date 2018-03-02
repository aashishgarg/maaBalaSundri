ActiveAdmin.register Category do

  menu label: 'Categories Master', parent: 'Masters'
  permit_params :name, :parent_id
  filter :name
  config.per_page = 10

  scope :root_categories
  scope :sub_categories, default: true


  # =========== Custom Form for categories(Edit/New) =============== #
  form do |f|
    f.inputs 'Categories and sub categories form' do
      f.semantic_errors
      f.input :parent_id, :label => 'Root category', as: :select2,
              collection: Category.root_categories.collect { |category| [category.name, category.id] }
      f.input :name
    end
    f.actions
  end

  # =========== Custom Index page ================================== #
  index do
    selectable_column
    id_column
    column :name do |category|
      if category.sub_category?
        label category.name.capitalize, class: 'sub_category_label'
      else
        label category.name.capitalize, class: 'root_category_label'
      end
    end
    column :root_category
    column :total_items, sortable: true do |category|
      if category.sub_category?
        label category.items.count
      else
        label category.sub_categories.collect { |x| x.items.count }.inject(&:+)
      end
    end
    column :created_at do |category|
      time_ago_in_words(category.created_at) + ' ago'
    end
    column :updated_at do |category|
      time_ago_in_words(category.updated_at) + ' ago'
    end
    actions
  end


end
