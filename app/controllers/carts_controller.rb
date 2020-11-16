class CartsController < ApplicationController
    before_action :set_cart, only: [:show, :edit, :update, :destroy]

    def index
        @carts = current_user.carts
    end

    def show
        
    end

    def new
        @cart = Cart.new
    end

    def edit
    end

    def create
        flight = Flight.find(params[:flight_id])
        @cart = current_user.carts.build(flight: flight)

        respond_to do |format|
            if @cart.save
            format.html { redirect_to flight, notice: 'Flight added to Cart' }
            else
            format.html { render :new }
            end
        end
    end

    def update
        respond_to do |format|
            if @cart.update(cart_params)
                format.html { redirect_to @cart, notice: 'Cart successfully updated.' }
            else
                format.html { render :new }
            end
        end
    end

    def destroy
        # @order = Order.find(session[:order_id])
        @cart.destroy
        respond_to do |format|
            format.html { redirect_to order_path(@order), notice: 'Flight successfully deleted.' }
            format.json { head :no_content }
        end
    end

    private

    def set_cart
        @cart = Cart.find(params[:id])
    end

    def cart_params
        params.require(:cart).permit(:flight_id)
    end
end
