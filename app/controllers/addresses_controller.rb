class AddressesController < ApplicationController
    def index
        @addresses = addresses.order("created_at DESC")
    end
    
    def new
        @address = Addresses.new
    end

    def create
        @address = Address.new(address_params)
        if @address.save
          redirect_to root_path
        else
          render :new
        end
    end
    
      private
    
    def address_params
        params.require(:address).permit(:prefecture_id)
    end
end
