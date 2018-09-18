class GenresController < ApplicationController
   before_action :require_admin, only: [:create]

  def index
    @genres = Genre.all
    @new_gen = Genre.new
  end

  def create
    Genre.create!(genre_params)
    redirect_to genres_path
  end

  def show
    @genre = Genre.find(params[:id])
    @rating = @genre.songs.average(:rating)
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

  def require_admin
      render file: "/public/404" unless current_admin?
  end

end
