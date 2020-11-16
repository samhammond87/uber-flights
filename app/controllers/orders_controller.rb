class OrdersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_order
    before_action :set_order, only: [:show, :edit, :update, :destroy]
    
    
    def index
        @orders = Order.all
    end

    def show
    end
    
    def new
        @order = Order.new
    end
    
    def edit
    end
    
    def create
        @order = Order.new(order_params)
    
        respond_to do |format|
            if @order.save
                format.html { redirect_to @order, notice: 'Order was succfully created.' }
                format.json { render json: @order, status: :created, location: @order }
            else
                format.html { render :new }
                format.json { render json: @order.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @order.update(order_params)
                format.html { redirect_to @order, notice: 'Order was successfully updated.' }
                format.json { render json: @order, status: :ok, location: @order }
            else
                format.html { render :edit }
                format.json { render json: @order.errors, status: :unprocessable_entity}
            end
        end
    end

    def destroy 
        @order.destroy if @order.id == session[:order_id]
        session[:order_id] = nil
        respond_to do |format|
            format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
        def set_order
            @order = Order.find(params[:id])
        end

        def order_params
            params.fetch(:order, {})
        end

        def invalid_order
            logger.error "Attempt to access invalid order #{params[:id]}"
            redirect_to flight_path, notice: "That order doesn't exist"
        end
    
    
    
    
    
    # before_action :authenticate_user!
  
    # def index
        # current_user.orders
        # @orders = Order.all
        # flights = @orders.flights.find(params[:id])
        # @user = Order.user
    # end
  
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
      
    # private
    
    # def order_params
    #     params.require(:order).permit(:total, :flight_ids => [])
    # end

end
