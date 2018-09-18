class GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
    @songs = @genre.songs
    @avg_rating = @genre.average_rating
  end
end