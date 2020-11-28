class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        @movies = current_user.movies
    end

    def show
    end

    def new
        @movie = Movie.new 
    end

    def edit
    end

    def create
        @movie = current_user.movies.build(movie_params)
        if @movie.save
            redirect_to @movie, notice: 'Movie was successfully added to your list.'
        else
            render :new
        end
    end

    def update
        if @movie.update(movie_params)
            redirect_to @movie, notice: 'Movie was successfully updated.'
        else
            render :edit 
        end
    end

    def destroy
        @movie.destroy 
        redirect_to movies_path, notice: 'Movie was successfully deleted from your list.'
    end

    def seen
        @movies = current_user.movies.seen
    end

    private

    def set_movie
        @movie = Movie.find(params[:id])
    end

    def movie_params 
        params.require(:movie).permit(:title, :release_year, :seen)
    end

end