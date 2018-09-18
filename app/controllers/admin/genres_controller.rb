class Admin::GenresController < ApplicationController

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = 'New genre added!'
      redirect_to genres_path
    else 
      flash[:notice] = 'Genre was not created.'
      redirect_to new_admin_genre_path
    end
  end

  private
    def genre_params
      params.require(:genre).permit(:name)
    end
end