class GenresController < ApplicationController
	def index
		@genres = Genre.order(name: :asc)
		@genre  = Genre.new
	end
end