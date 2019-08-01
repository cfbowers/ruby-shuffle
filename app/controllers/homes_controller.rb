class HomesController < ApplicationController

  def index
    @movie 
    @genres = Genre.all
  end

  def new
    raise params.inspect
    genres_array = pa
  end

  def show
  end

end
