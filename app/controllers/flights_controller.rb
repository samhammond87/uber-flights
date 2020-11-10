class FlightsController < ApplicationController
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

    def show
        @flight = Flight.find(params[:id])
    end

    def edit
    end

    private
  def flight_params
    params.require(:flight).permit(:title, :description)
  end

end
