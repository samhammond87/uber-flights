class OrdersController < ApplicationController
    # before_action :authenticate_user!
  
    def index
        # current_user.orders
        @orders = Order.all
        # flights = @orders.flights.find(params[:id])
        # @user = Order.user
    end
  
    # def show
    #     current_user.orders.find(params[:id])
    # end

    # def create
    #     @order = current_user.orders.build(order_params)
    #     if @order.save
    #         redirect_to @orders
    #     else 
    #         
    #     end
    # end
      
    private
    
    # def order_params
    #     params.require(:order).permit(:total, :flight_ids => [])
    # end

end
