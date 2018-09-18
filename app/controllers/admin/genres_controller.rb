class Admin::GenresController < Admin::BaseController
  def create
      @genre = Genre.create(genre_params)
      if @genre.save
        flash[:notice] = "You created #{@genre.name}"
        redirect_to genres_path
      else
        flash[:notice] = 'Something went wrong try again!'
        redirect_to genres_path
      end
    end


private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
