class CreateOrderPromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :order_promotions do |t|
      t.references :order, foreign_key: true
      t.references :promotion, foreign_key: true

      t.timestamps
    end
  end
end
