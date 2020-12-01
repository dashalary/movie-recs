class CategoriesController < ApplicationController

    def index
        @categories = Category.all 
    end
    
    def new
        @category = Category.new
    end

    def create
        @category = current_user.categories.build(category_params)
        if @category.save
            redirect_to category_path(@category)
        else
            redirect_to new_category_path
        end
    end

    def show
        @category = Category.find_by(id: params[:id])
            if @category
                @movies = current_user.movies.where(category_id: params[:id])
                render :show 
            end
    end

    def edit
        @category = Category.find_by(id: params[:id])
    end

    def update
    end

    private

    def category_params
        params.permit(:name, :user_id, :movie_id)
    end


end