class Cart < ApplicationRecord
  # self.table_name = 'carts'
  belongs_to :flight
  belongs_to :user

  def total_cost
    flight.cost.to_i * quantity.to_i
  end

  
end
