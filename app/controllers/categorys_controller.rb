class CategorysController < ApplicationController
    def index
        @categorys = Category.order("created_at DESC")        
    end

    def new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
          redirect_to root_path
        else
          render :new
        end
      end
    
      private
    
      def category_params
        params.require(:category).permit(:genre_id)
      end
end
