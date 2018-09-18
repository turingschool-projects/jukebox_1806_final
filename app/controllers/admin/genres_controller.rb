class Admin::GenresController < Admin::BaseController

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(genre_params)
    if @genre.save
      redirect_to genres_path
    else
      redirect_to genres_path
    end
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
