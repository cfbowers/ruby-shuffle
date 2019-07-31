class GenresController < ApplicationController

  def index
    @genres = Genre.all
    binding.pry
  end

end
