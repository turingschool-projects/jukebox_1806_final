require "rails_helper"

describe "As a visitor" do
  describe "when I visit the genre index" do
    it 'should show all genres' do
      genre_1 = Genre.create!(name: "Blues")
      genre_2 = Genre.create!(name: "Alternative")
      genre_3 = Genre.create!(name: "Trip Hop")

      visit genres_path

      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
      expect(page).to have_content(genre_3.name)
    end

    it 'should not show link to make a new genre, should have links to genre show' do
      genre_1 = Genre.create!(name: "Blues")
      genre_2 = Genre.create!(name: "Alternative")
      genre_3 = Genre.create!(name: "Trip Hop")

      visit genres_path

      expect(page).to_not have_content("Add New Genre")

      click_on(genre_1.name)
      expect(current_path).to eq(genre_path(genre_1))

      visit genres_path
      click_on(genre_2.name)
      expect(current_path).to eq(genre_path(genre_2))
    end
  end
end
