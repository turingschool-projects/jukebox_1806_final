class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.create!(genre_params)
    redirect_to genres_path
  end

  def show
    @genre = Genre.find(params[:id])
    @average_rating = @genre.average_rating
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
