class Admin::GenresController < Admin::BaseController
  def new
    @genre = Genre.new
  end

end
