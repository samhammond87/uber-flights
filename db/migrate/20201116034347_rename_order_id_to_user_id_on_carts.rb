class RenameOrderIdToUserIdOnCarts < ActiveRecord::Migration[6.0]
  def change
    remove_column :carts, :order_id
    add_reference :carts, :user, foreign_key: true, null: false
  end
end
