class AddOrderRefToCheckouts < ActiveRecord::Migration[5.1]
  def change
    add_reference :checkouts, :order, foreign_key: true
  end
end
