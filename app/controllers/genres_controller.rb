class GenresController < ApplicationController
  helper_method :current_user

  before_action :current_admin?, only: [:new, :create]

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
  end
end
