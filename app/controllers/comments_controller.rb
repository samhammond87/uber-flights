class CommentsController < ApplicationController
    
    def create
        @flight = Flight.find(params[:flight_id])
        @comment = @flight.comments.create(comment_params)
        redirect_to flight_path(@flight)
    end
     
    def destroy
        @flight = Flight.find(params[:flight_id])
        @comment = @flight.comments.find(params[:id])
        @comment.destroy
        redirect_to flight_path(@flight)
    end

    private
        def comment_params
          params.require(:comment).permit(:body)
        end
end
# :commenter, 