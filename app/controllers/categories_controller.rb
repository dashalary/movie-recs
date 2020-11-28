class CategoriesController < ApplicationController

    def new
    end

    private

    def category_params
        params.permit(:name)
    end


end