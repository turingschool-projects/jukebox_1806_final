class GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

end
