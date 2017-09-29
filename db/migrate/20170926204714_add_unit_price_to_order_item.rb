class AddUnitPriceToOrderItem < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :unit_price, :decimal, precision: 5, scale: 2
  end
end
