class AddQuantityToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :quantity, :integer, default: 1
  end
end
