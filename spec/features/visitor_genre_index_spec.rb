# User Story 2:

# As a Visitor,
#   When I visit the genre index page,
#     I see all genres in the database.

# Testing requirements:
# - users should see at least 2 genres listed on the page

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