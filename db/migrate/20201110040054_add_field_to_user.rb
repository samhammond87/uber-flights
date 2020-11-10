class AddFieldToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :city, :string
    add_column :users, :aviator, :boolean
    add_column :users, :license, :string
    add_column :users, :experience, :string
  end
end
