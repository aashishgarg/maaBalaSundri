ActiveAdmin.register OrderDetail do
  menu label: 'Order items', parent: 'ORDERS'
  config.per_page = 10
  actions :all, :except => [:new, :destroy]

  scope('Filtered', default: true) { |scope| params[:bill_id] ? scope.where(order_header_id: params[:bill_id]) : scope.today }
  scope(Date.today.strftime '%A'){|scope| scope.where('Date(created_at) = (?)', Date.today)}
  scope :week
  scope :month
  scope :year
  scope :all

  index do
    id_column
    column 'Bill No', sortable: true do |order|
      link_to order.order_header.bill_no, admin_order_header_path(order.header_id)
    end
    column :item_variant
    column :sku do |order|
      label order.item_variant.sku if order.item_variant
    end
    column :sku, label: 'Style no' do |order|
      label order.item_variant.new_style_no if order.item_variant
    end
    column :quantity
    column :color do |order|
      label order.item_variant.color.name if order.item_variant
    end
    column :size do |order|
      label order.item_variant.size.name if order.item_variant
    end
    column :image do |order|
      image_tag order.item.item_variants.first.item_image, class: 'item_image' if order.item_variant
    end
    column :created_at do |order|
      time_ago_in_words(order.created_at) + ' ago'
    end
  end
end
