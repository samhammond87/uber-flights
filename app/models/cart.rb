class Cart < ApplicationRecord
  # self.table_name = 'carts'
  belongs_to :flight
  belongs_to :user
end
