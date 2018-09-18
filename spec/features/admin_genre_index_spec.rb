require 'rails_helper'

describe 'As an admin' do
	describe 'When I visit the genre index page' do
		before(:each) do
			admin = User.create(
				username: 						 'admin',
				password: 						 'password',
				password_confirmation: 'password',
				role: 								 1
			)
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

			@genre1 = Genre.create(name: 'Alternative Rock')
			@genre2 = Genre.create(name: 'Americana')
		end
		it 'displays genres like a visitor would see' do
			visit genres_path

			expect(page).to have_content(@genre1.name)
			expect(page).to have_content(@genre2.name)
		end
		it 'has a form to add a new genre' do
			visit genres_path

			expect(page).to have_field(:genre_name)
			expect(page).to have_button('Create Genre')
		end
		it 'allows me to add a new genre' do
			new_genre = 'Bluegrass'

			visit genres_path

			fill_in :genre_name, with: new_genre
			click_button 'Create Genre'

			expect(current_path).to eq(genres_path)
			expect(page).to have_content(new_genre)
			expect(page).to have_content(@genre1.name)
			expect(page).to have_content(@genre2.name)
		end
	end
end