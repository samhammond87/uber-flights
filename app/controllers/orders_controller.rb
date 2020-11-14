class OrdersController < ApplicationController
    before_action :authenticate_user!
  
    def index
      current_user.orders
    end
  
    def show
        current_user.orders.find(params[:id])
        # @flight = Flight.find(params[:id])
    end

    def create
        order = current_user.orders.build(order_params)
        if order.save
            render json: order, status: 201, location: [:api, current_user, order]
        else
            render json: { errors: order.errors }, status: 422
        end
    end
      
    private
    
    def order_params
        params.require(:order).permit(:flight_ids => [])
    end

end
