# s an admin user,
#   When I visit the same genre index page that visitors see,
#     And I fill out the form with a new genre's name and submit that form,
#   I return to the genre index page that visitors see,
#     And I see all previous genres and the new genre I have just created.

require 'rails_helper'

describe 'genre index' do
  describe 'as an admin' do
    scenario 'admin can also see create a genre' do
      genre_1 = Genre.create!(name: "Folk")
      genre_2 = Genre.create!(name: "Jazz")
      admin = User.create!(username: "Dr.Who", password: "blue", password_confirmation: "blue", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      fill_in :genre_name, with: "Disco"
      click_on "Create Genre"

      new_genre = Genre.last
      expect(current_path).to eq(genres_path)
      expect(page).to have_content(new_genre.name)
      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
    end
  end
end
