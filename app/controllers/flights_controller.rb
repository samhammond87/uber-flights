class FlightsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_link, only:[:destroy, :edit, :update, :show]
    
    # .includes for eager loading
    
    def index
        @flights = Flight.includes(:user, flight_picture_attachment: :blob)
    end
    
    def new
        @flight = Flight.new
    end

    def create
        @flight = Flight.new(flight_params)
        @flight.user = current_user
            if @flight.save
                redirect_to @flight
            else 
                render 'new'
            end
    end 

    def show
      session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
          price_data: {
            unit_amount: (@flight.cost * 100).to_i,
            currency: 'aud',
          product_data: {
            name: @flight.title,
            images: ["uber_flights_logo.png"],
            description: @flight.description,
            },
          },
          quantity: 1,
        }],
              payment_intent_data: {
              metadata: {
                flight_id: @flight.id,
                user_id: current_user.id
              }
          },
        mode: 'payment',
          success_url: "#{root_url}payments/success?flightId=#{@flight.id}",
          cancel_url: "#{root_url}flights"
      })
      
        @session_id = session.id
      
  end

    def edit
    end

    def update
        authorize! :update, @flight
        if @flight.update(flight_params)
          redirect_to @flight
        else
          render 'edit'
        end
    end


    def destroy
        authorize! :destroy, @flight
        @flight.destroy
        redirect_to flights_path
    end

    private
    
  def flight_params
    params.require(:flight).permit(:title, :cost, :duration, :capacity, :description, :flight_picture)
  end

  def set_link
    @flight = Flight.find(params[:id])
  end

end
