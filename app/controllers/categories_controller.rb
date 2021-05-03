class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @categories = current_user.categories.uniq
    end
    
    def new
        @category = Category.new(movie_id: params[:movie_id])
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
        @category = current_user.categories.find_by(id: params[:id])
            if @category
                @movies = current_user.movies.where(category_id: params[:id])
                render :show 
            end
    end


    private

    def category_params
        params.require(:category).permit(:name, :user_id, :movie_id)
    end


end