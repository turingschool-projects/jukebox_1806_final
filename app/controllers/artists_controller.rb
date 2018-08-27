class ArtistsController < ApplicationController

  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.new(artist_params)
    if artist.save
      redirect_to artists_path
    else
      render :new
    end
  end

  def index
    @artists = Artist.all
  end

  private
    def artist_params
      params.require(:artist).permit(:name)
    end
end
