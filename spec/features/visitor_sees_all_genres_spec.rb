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
  end
end
