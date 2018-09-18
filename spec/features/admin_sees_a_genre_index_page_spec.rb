require 'rails_helper'

describe "As an admin" do
  context "they visit /admin/genres" do
    it 'displays a form to create a new genre' do

      admin = User.create(username: "Ian", password: "test123", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      genre_1 = Genre.create!(name: "Dance")
      genre_2 = Genre.create!(name: "Folk")
      genre_3 = Genre.create!(name: "Country")
      genre_4 = Genre.create!(name: "Rock")

      visit admin_genres_path

      expect(page).to have_content("Create New Genre")
    end

    it "they can create a new genre" do
      admin = User.create(username: "Ian", password: "test123", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      genre_1 = Genre.create!(name: "Dance")
      genre_2 = Genre.create!(name: "Folk")
      genre_3 = Genre.create!(name: "Country")
      genre_4 = Genre.create!(name: "Rock")

      visit admin_genres_path

      fill_in :genre_name, with: "Heavy Metal"
      click_on "Create"

      expect(current_path).to eq(genres_path)
      expect(page).to have_content("Heavy Metal")
      expect(page).to have_content("Dance")
      expect(page).to have_content("Folk")
      expect(page).to have_content("Rock")
    end
  end
end
