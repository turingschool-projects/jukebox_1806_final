require 'rails_helper'


describe "As a visitor" do
  context "they visit the genre index " do
    it 'displays all of the genres' do
      genre_1 = Genre.create!(name: "Dance")
      genre_2 = Genre.create!(name: "Folk")
      genre_3 = Genre.create!(name: "Country")
      genre_4 = Genre.create!(name: "Rock")

      visit genres_path

      expect(page).to have_content("Dance")
      expect(page).to have_content("Folk")
      expect(page).to have_content("Country")
      expect(page).to have_content("Rock")

    end

    it 'does not show a form to create a genre' do
      genre_1 = Genre.create!(name: "Dance")
      genre_2 = Genre.create!(name: "Folk")
      genre_3 = Genre.create!(name: "Country")
      genre_4 = Genre.create!(name: "Rock")

      visit genres_path

      expect(page).to_not have_content("Create New Genre")
      expect(page).to have_content("Country")
      expect(page).to have_content("Rock")
    end

    context "they click on a genre's name" do
      it 'takes them to the genre show page' do
        genre_1 = Genre.create!(name: "Dance")
        genre_2 = Genre.create!(name: "Folk")
        genre_3 = Genre.create!(name: "Country")
        genre_4 = Genre.create!(name: "Rock")

        visit genres_path

        click_on "#{genre_1.name}"

        expect(current_path).to eq(genre_path(genre_1))
      end
    end
  end
end
