class SalesStatusesController < ApplicationController
    def index
        @sales_statuses = sales_statuses.order("created_at DESC")
    end
    
    def new
    end

    def create
        @sales_status = Sales_status.new(sales_status_params)
        if @sales_status.save
          redirect_to root_path
        else
          render :new
        end
    end
    
      private
    
    def sales_status_params
        params.require(:sales_status).permit(:status_id)
    end
end
