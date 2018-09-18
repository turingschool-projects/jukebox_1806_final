# As an admin user,
#   When I visit the same genre index page that visitors see,
#   I see the same information visitors see,
#     And I also see a form to create a new genre.
require 'rails_helper'

describe 'genre index' do
  describe 'as an admin' do
    scenario 'admin can also see all genres' do
      genre_1 = Genre.create!(name: "Folk")
      genre_2 = Genre.create!(name: "Jazz")

      visit genres_path

      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
    end
    scenario 'admin can also see a form to create a new genre' do

      visit genres_path

      expect(page).to have_content("Create new genre:")
      expect(page).to have_content("Name:")
      expect(page).to have_button("Create Genre")
    end
  end
end
