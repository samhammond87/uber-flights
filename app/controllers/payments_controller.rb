class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]
    def success
        # p "......................"
        # cart.cart_flights.purchased_at = timestamp
        # Time.now 
        p params
        # p "*******************"
        # p params[:cart]
    end

    def webhook
        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        flight_id = payment.metadata.flight_id
        
        #user_id = payment.metadata.user_id
        p "Cart id" + cart_id
        
        #p "user id " + user_id
        # add new order model here
        render plain: "Success"
    end  
end