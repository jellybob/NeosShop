class AddAddressToCheckouts < ActiveRecord::Migration[5.1]
  def change
    add_column :checkouts, :address, :string
  end
end
