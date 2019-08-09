require 'movie_db'

class HomesController < ApplicationController

  def index
    @movie
    @genres = Genre.all
  end

  def new

  end

  def show
    mdb = Mdb.new
    @results = mdb.query_movies(movie_params)['results']
    @base = "https://image.tmdb.org/t/p/w500#{@results[0]['backdrop_path']}"
  end

  private

  def movie_params
    params[:movie]
  end

end
