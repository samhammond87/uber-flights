class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]
    def success
    end

    def webhook
        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        flight_id = payment.metadata.flight_id
        #user_id = payment.metadata.user_id
        p "Flight id " + flight_id
        #p "user id " + user_id
        # add new order model here
        render plain: "Success"
    end  
end