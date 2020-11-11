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

    def show
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
    params.require(:flight).permit(:title, :cost, :duration, :capacity, :description)
  end

  def set_link
    @flight = Flight.find(params[:id])
  end

end
