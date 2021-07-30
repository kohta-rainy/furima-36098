class ScheduledDeliveriesController < ApplicationController
    def index
        @scheduled_deliveries = scheduled_deliveries.order("created_at DESC")
    end
    
    def new
        @scheduled_delivery = scheduled_delivery.new
    end

    def create
        @scheduled_delivery = Scheduled_delivery.new(scheduled_delivery_params)
        if @scheduled_delivery.save
          redirect_to root_path
        else
          render :new
        end
    end
    
      private
    
    def scheduled_delivery_params
        params.require(:scheduled_delivery).permit(:day_id)
    end
end
