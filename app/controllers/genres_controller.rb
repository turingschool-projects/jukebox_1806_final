class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def show
    #binding.pry
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    if current_admin?
     Genre.create(genre_params)
    end
    redirect_to genres_path
    #I tried to create an instance variable here but it kept saying it was nil in the form
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
