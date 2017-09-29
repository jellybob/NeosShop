class CreatePromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :promotions do |t|
      t.decimal :code, precision: 4, scale: 2
      t.string :promo_type
      t.boolean :standalone

      t.timestamps
    end
  end
end
