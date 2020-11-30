class CategoriesController < ApplicationController

    def index
        @categories = Category.all 
    end
    
    def new
    end

    private

    def category_params
        params.permit(:name)
    end


end