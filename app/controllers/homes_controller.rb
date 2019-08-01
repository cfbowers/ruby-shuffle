class HomesController < ApplicationController

  def index
    @movie
    @genres = Genre.all
  end

  def new
    if params[:movie][:genres][:id]
      genre_id_array = []
      params[:movie][:genres][:id].each do |g|
        genre_id_array << g.to_i
      end
      raise params.inspect
    else
      redirect_to root
    end
  end

  def show
  end

end
