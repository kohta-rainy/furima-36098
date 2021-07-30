class ShippingFeeStatusesController < ApplicationController
    def index
        @shipping_fee_statuses = shipping_fee_statuses.order("created_at DESC")
    end
    
    def new
        @shipping_fee_status = Shipping_fee_status.new
    end

    def create
        @shipping_fee_status = Shipping_fee_status.new(shipping_fee_status_params)
        if @shipping_fee_status.save
          redirect_to root_path
        else
          render :new
        end
    end
    
      private
    
    def shipping_fee_status_params
        params.require(:shipping_fee_status).permit(:load_id)
    end
end
