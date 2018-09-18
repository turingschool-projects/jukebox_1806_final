require 'rails_helper'

describe 'As a visitor' do
	describe 'when I visit a genre show page' do
		before(:each) do
			@genre1  = Genre.create(name: 'Alternative Rock')
			@genre2  = Genre.create(name: 'Americana') 

			@artist1 = Artist.create(name: 'Smashing Pumpkins')
			@artist2 = Artist.create(name: 'Temple of the Dog')
			@artist3 = Artist.create(name: 'Railroad Earth')

			@song1   = @artist1.songs.create(title: '1979', length: 180, play_count: 5, rating: 2)
			@song2   = @artist2.songs.create(title: 'Hunger Strike', length: 220, play_count: 7, rating: 5)

			@song3   = @artist3.songs.create(title: 'The Hunting Song', length: 321, play_count: 12, rating: 5)

			@genre1.songs << [@song1, @song2]
			@genre2.songs << @song3
		end
		it 'displays all songs in that genre' do
			visit genre_path(@genre1)

			expect(page).to have_content(@genre1.name)
			expect(page).to have_content(@song1.title)
			expect(page).to have_content(@song2.title)
			expect(page).to_not have_content(@song3.title)
		end
		it 'displays average rating for songs in that genre' do
			visit genre_path(@genre1)

			expect(page).to have_content("Average Song Rating: #{@genre1.avg_rating}")
		end
		it 'displays name and rating of song with highest rating' do
			visit genre_path(@genre1)

			within("#highest-rated-song") do
				expect(page).to have_content(@song2.title)
				expect(page).to have_content("Rating: #{@song2.rating}")
			end
		end
		it 'displays name and rating of song with highest rating' do
			visit genre_path(@genre1)

			within("#lowest-rated-song") do
				expect(page).to have_content(@song1.title)
				expect(page).to have_content("Rating: #{@song1.rating}")
			end
		end
	end
end