class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.string :title
      t.float :cost
      t.string :duration
      t.integer :capacity
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
