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

    if (movie_params[:genres].nil?) && (movie_params[:year_start].empty?) && (movie_params[:year_end].empty?) && (movie_params[:keywords].empty?)
      redirect_to root_path
    else
      genres_array = session[:genres] = []
      keywords_array = session[:keywords] = []
      year_array = session[:year] = []

      if !movie_params[:genres].nil?
        movie_params[:genres][:id].map do |g|
          genres_array << g.to_i
        end
      end

      if !movie_params[:keywords].empty?
        words_array = movie_params[:keywords].split(", ")
        words_array.map do |k|
          keywords_array << k
        end
      end

      if !movie_params[:year_start].empty? && !movie_params[:year_end].empty?
        year_array << movie_params[:year_start]
        year_array << movie_params[:year_end]
      elsif !movie_params[:year_start].empty? && movie_params[:year_end].empty?
        year_array << movie_params[:year_start]
      elsif movie_params[:year_start].empty? && !movie_params[:year_end].empty?
        year_array << movie_params[:year_end]
      end
      redirect_to homes_show_url
    end
  end

  def show
    @keywords = session[:keywords]
    @year = session[:year]
    @genres = session[:genres]
  end

  private

  def movie_params
    params[:movie]
  end

end
