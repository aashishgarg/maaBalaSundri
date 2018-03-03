ActiveAdmin.register OrderHeader do
  menu label: 'Orders', parent: 'ORDERS'
  config.per_page = 10
  actions :all, :except => [:new, :destroy]

  scope -> { Date.today.strftime '%A' }, :today, default: true
  scope :week
  scope :month
  scope :year
  scope :all

  filter :bill_no_cont
  filter :user_name_cont

  index do
    id_column
    column :bill_no do |order|
      link_to order.bill_no, admin_order_details_path(bill_id: order.id)
    end
    column :user do |order|
      label order.user.name.capitalize + ' ('+order.user.email+')'
    end
    column :total_items do |order|
      label order.order_details.count
    end
    column :total_quantity do |order|
      label order.order_details.collect(&:quantity).compact.inject(&:+)
    end
    column :created_at do |order|
      time_ago_in_words(order.created_at) + ' ago'
    end
  end

  csv do
    column :id
    column :bill_no
    column(:customer_name) { |order| order.user.name.capitalize }
    column(:customer_email) { |order| order.user.email }
    column(:total_items) { |order| order.order_details.count }
    column(:total_quantity) { |order| order.order_details.collect(&:quantity).inject(&:+) }
    column(:created_at) { |order| order.created_at }
  end
end
