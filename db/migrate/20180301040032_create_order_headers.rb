class CreateOrderHeaders < ActiveRecord::Migration[5.1]
  def change
    create_table :order_headers do |t|
      t.belongs_to :user
      t.string :bill_no
      t.string :status, default: 'open'

      t.timestamps
    end
  end
end
