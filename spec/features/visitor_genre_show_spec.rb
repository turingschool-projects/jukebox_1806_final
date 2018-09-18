require 'rails_helper'

describe 'As a visitor' do
	describe 'when I visit a genre show page' do
		it 'displays all songs in that genre' do
			genre1  = Genre.create(name: 'Alternative Rock')
			genre2  = Genre.create(name: 'Americana') 

			artist1 = Artist.create(name: 'Smashing Pumnpkins')
			artist2 = Artist.create(name: 'Temple of the Dog')
			artist3 = Artist.create(name: 'Railroad Earth')

			song1   = artist1.songs.create(title: '1979', length: 180, play_count: 5, rating: 4)
			song2   = artist2.songs.create(title: 'Hunger Strike', length: 220, play_count: 7, rating: 5)
			song3   = artist3.songs.create(title: 'The Hunting Song', length: 321, play_count: 12, rating: 4)

			genre1.songs << [song1, song2]
			genre2.songs << song3

			visit genre_path(genre1)

			expect(page).to have_content(genre1.name)
			expect(page).to have_content(song1.title)
			expect(page).to have_content(song2.title)
			expect(page).to_not have_content(song3.title)
		end
	end
end