class Admin::GenresController < ApplicationController
  before_action :set_genre, only: [:show]

  def index
    @genres = Genre.all
    @genre = Genre.create(genre_params)
  end

  def new
    @genre = Genre.new
    @admin = current_user.role

  end

  def create
    @admin = current_user.role
    @genre = Genre.create(genre_params)
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

  def set_genre
    @genre = Genre.find_by(params[:name])
  end

end
