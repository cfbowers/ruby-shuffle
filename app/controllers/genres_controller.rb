class GenresController < ApplicationController

  def index
    @genres = Genre.new
  end

end
