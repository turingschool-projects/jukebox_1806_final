require 'rails_helper'

describe 'As a visitor' do
	describe 'When I visist genre index page' do
		it 'displays all genres in the database' do
			genre1 = Genre.create(name: 'Alternative Rock')
			genre2 = Genre.create(name: 'Americana')

			visit genres_path

			expect(page).to have_content(genre1.name)
			expect(page).to have_content(genre2.name)
		end
	end
end