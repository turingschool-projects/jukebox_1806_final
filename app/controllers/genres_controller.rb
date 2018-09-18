class GenresController < ApplicationController
	def index
		@genres = Genre.order(name: :asc)
		@genre  = Genre.new
	end

	def create
		genre = Genre.create(genre_params)
		genre.save

		redirect_to genres_path
	end

	def show
		@genre 			 = Genre.find(params[:id])
		@genre_songs = @genre.songs
	end

	private

	def genre_params
		params.require(:genre).permit(:name)
	end
end