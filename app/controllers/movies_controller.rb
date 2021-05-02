class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!


    def index
       if params[:category_id]
        @movies = Category.find(params[:category_id]).movies 
       else
        @movies = current_user.movies
        # render json: @movies.to_json
       end
    end

    def show
        # binding.pry
    end

    def new
        @movie = Movie.new(category_id: params[:category_id])
    end

    def edit
    end

    def create
        @movie = current_user.movies.build(movie_params)
        if @movie.save
            redirect_to @movie
        else
            render :new
        end
    end

    def update
        if @movie.update(movie_params)
            redirect_to @movie
        else
            render :edit 
        end
    end

    def destroy
        @movie.destroy 
        redirect_to movies_path
    end

    def seen
        @movies = current_user.movies.seen
    end

    # def oldest
    #     @oldestmovie = current_user.movies.oldest
    # end

    private

    def set_movie
        @movie = current_user.movies.find_by(id: params[:id])
        if !@movie
            redirect_to movies_path, notice: "You don't have access to this page."
        end
    end

    def movie_params 
        params.require(:movie).permit(:title, :release_year, :seen, :user_id, :category_id, category_attributes: [ :name ])
    end

end