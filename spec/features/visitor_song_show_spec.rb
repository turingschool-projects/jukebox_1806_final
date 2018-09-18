require 'rails_helper'

describe 'As a visitor' do
	describe 'when I visit a song show page' do
		it 'shows the numeric rating for a song' do
			artist = Artist.create(name: 'STS9')
			song   = artist.songs.create(title: 'Moonsocket', length: 300, play_count: 20, rating: 5)

			visit song_path(song.slug)

			expect(page).to have_content("Rating: #{song.rating}")
		end
	end
end