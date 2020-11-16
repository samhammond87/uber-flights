class CartsController < ApplicationController
    include CurrentOrder
    before_action :set_cart, only [:show, :edit, :update, :destroy]
    before_action :set_order, only: [:create]

    def index
        @carts = Cart.all
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
        @cart = @order.add_flight(cart_params)

        respond_to do |format|
            if
            format.html { redirect_to @cart.order, notice: 'Flight added to Cart' }
            format.json { render :show, status: :created, location: @cart}
            else
            format.html { render :new }
            format.json { render json: @cart.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @cart.update(cart_params)
                format.html { redirect_to @cart, notice: 'Cart successfully updated.' }
                format.json { render :show, status: :ok, location: @cart }
            else
                format.html { render :new }
                format.json { render json: @cart.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @cart.destroy
        respond_to do |format|
            format.html { redirect_to carts_url, notice: 'Flight successfully deleted.' }
            format.json { head :no_content }
        end
    end

    private

    def set_cart
        @cart = Cart.find(params[:id])
    end

end
