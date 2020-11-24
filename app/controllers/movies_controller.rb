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

    def create
        @movie = Movie.new(movie_params)
    end

    def edit
    end

end