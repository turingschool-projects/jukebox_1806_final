class GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    Genre.create(genre_params)
    flash[:notice] = "Successfully created a new genre!"
    redirect_to genres_path
  end
  
  private

    def genre_params
      params.require(:genre).permit(:name)
    end
end
