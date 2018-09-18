require 'rails_helper'

describe 'As a visitor' do
	describe 'when I visit a song show page' do
		before(:each) do
			@artist = Artist.create(name: 'STS9')
			@song   = @artist.songs.create(title: 'Moonsocket', length: 300, play_count: 20, rating: 5)
			@genre1 = @song.genres.create(name: 'Livetronica')
			@genre2 = @song.genres.create(name: 'Instrumental')
			@genre3 = Genre.create(name: 'Americana')
			@genre4 = Genre.create(name: 'Bluegrass')
		end
		it 'shows the numeric rating for a song' do
			visit song_path(@song.slug)

			expect(page).to have_content("Rating: #{@song.rating}")
		end
		it 'displays genres associated with this song' do
			visit song_path(@song.slug)

			expect(page).to have_content(@genre1.name)
			expect(page).to have_content(@genre2.name)
			expect(page).to_not have_content(@genre3.name)
			expect(page).to_not have_content(@genre4.name)
		end
	end
end