class FlightsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_link, only:[:destroy, :edit, :update, :show]
    
    def index
        @flights = Flight.all
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

    # def show
    #   session = Stripe::Checkout::Session.create(
    #     payment_method_types: ['card'],
    #     customer_email: current_user.email,
    #     line_items: [{
    #         name: @flight.title,
    #         description: @flight.description,
    #         images: @flight.flight_picture,
    #         amount: @flight.cost.to_i, 
    #         currency: 'aud',
    #         quantity: 1,
    #     }],
    #     payment_intent_data: {
    #         metadata: {
    #             event_id: @flight.id
    #         },
    #     },
      
    #     success_url: "#{root_url}payments/success?flightId=#{@flight.id}",
    #     cancel_url: "#{root_url}flights"
    #   )
    #   @session_id = session.id
    # end
    def show
      session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        line_items: [{
          price_data: {
            unit_amount: 2000,
            currency: 'usd',
            product_data: {
              name: 'Stubborn Attachments',
              images: ['https://i.imgur.com/EHyR2nP.png'],
            },
          },
          quantity: 1,
        }],
        mode: 'payment',
        success_url: '/success.html',
        cancel_url: '#{root_url}/cancel.html',
      })
      {
        id: session.id
      }.to_json
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
