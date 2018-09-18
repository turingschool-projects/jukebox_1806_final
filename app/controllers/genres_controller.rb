class GenresController < ApplicationController

  def create
    genre = Genre.create(genre_params)
    redirect_to genres_path
  end

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
    @songs = Song.all
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
