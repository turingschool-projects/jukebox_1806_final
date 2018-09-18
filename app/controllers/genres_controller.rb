class GenresController < ApplicationController

  def show
    @genre = Genre.find(params[:id])
    @songs = @genre.songs
  end

  def index
    @user = current_user
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    if current_user.role == "admin"
      Genre.create(genre_params)
      redirect_to genres_path
    else
      render ("/public/404")
    end

  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
