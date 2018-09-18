class GenresController < ApplicationController
	def index
		@genres = Genre.order(name: :asc)
		@genre  = Genre.new
	end

	def show
		@genre 			 = Genre.find(params[:id])
		@genre_songs = @genre.songs
	end
end