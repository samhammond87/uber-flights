class CartsController < ApplicationController
    before_action :set_cart, only: [:show, :edit, :update, :destroy]

    def index
        @carts = current_user.carts.includes(:flight).where(purchased_at: nil)
        @total = @carts.inject(0) { |acc, cart| acc + cart.flight.cost }

        session = Stripe::Checkout::Session.create({
            
            payment_method_types: ['card'],
            customer_email: current_user.email,
            line_items: [{
              price_data: {
                unit_amount: (@total * 100).to_i,
                currency: 'aud',
              product_data: {
                name: @total,
                # images: ["uber_flights_logo.png"],
                # description: @flight.description,
                },
              },
              quantity: 1,
            }],
            payment_intent_data: {
                metadata: {
                cart_id: @carts,
                user_id: current_user.id
                }
            },
            mode: 'payment',
              success_url: "#{root_url}payments/success",
              cancel_url: "#{root_url}flights"
          })
          
            @session_id = session.id
    end

    def show
        
    end

    def new
        @cart = Cart.new
    end

    def create
        p "********************************"
        flight = Flight.find(params[:flight_id])
        @cart = current_user.carts.build(flight: flight)

        respond_to do |format|
            if @cart.save
            format.html { redirect_to carts_path, notice: 'Flight added to Cart' }
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
