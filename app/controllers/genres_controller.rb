class GenresController < ApplicationController
	def index
		@genres = Genre.order(name: :asc)
	end
end