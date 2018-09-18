require 'rails_helper'

describe 'As a visitor' do
	describe 'When I visist genre index page' do
		before(:each) do
			@genre1 = Genre.create(name: 'Alternative Rock')
			@genre2 = Genre.create(name: 'Americana')
		end
		it 'displays all genres in the database' do
			visit genres_path

			expect(page).to have_content(@genre1.name)
			expect(page).to have_content(@genre2.name)
		end
		it 'does not display form to create genre' do
			visit genres_path

			expect(page).to_not have_field(:genre_name)
			expect(page).to_not have_button('Create Genre')
		end
		it 'has links to genre show page' do
			visit genres_path

			expect(page).to have_link(@genre1.name, href: genre_path(@genre1))
			expect(page).to have_link(@genre2.name, href: genre_path(@genre2))
		end
	end
end