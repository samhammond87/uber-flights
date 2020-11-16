class Order < ApplicationRecord
  # before_validation :set_total!
  
  belongs_to :user
  
  has_many :carts, dependent: :destroy


  def add_flight(flight)
    current_item = carts.find_by(flight_id: flight.id)
    
    if current_item 
      current_item.increment(:quantity)
    else
      current_item = carts.build(flight_id: flight.id)
    end
    current_item
  end

  def total_cost
    carts.to_a.sum { |item| item.total_cost }
  end




  # has_many :flights, through: :orders

  # validates :total, presence: true, 
  # numericality: { greater_than_or_equal_to: 0 }

  # validates :user_id, presence: true

  # def set_total!
  #   self.total = flights.map(&:cost).sum
  # end

  # def total_price
  #   flight.cost.to_i * quantity.to_i
  # end
end
