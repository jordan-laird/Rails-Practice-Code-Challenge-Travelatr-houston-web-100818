class DestinationsController < ApplicationController
    before_action :current_dest

    def index
        @destinations = Destination.all
    end
    # def create

    # end
    
    def dest_params
        params.require(:destinations).permit(:name, :country)
    end

    def  current_dest
        if params[:id]
            @destination = Destination.find(params[:id])
        else
            @destination = Destination.new
        end
    end
end
