require 'rails_helper'

describe "as an admin" do
  describe "when I visit the genre index page" do
    it "should show me a create new genre form and create a genre" do
      admin = User.create!(username: "Ben",
                          password: "123",
                          password_confirmation: "123",
                          role: 1
                        )
      genre1 = Genre.create(name: "Pop")
      genre2 = Genre.create(name: "Funk")
      genre3 = Genre.create(name: "Dance")

      visit login_path

      fill_in "Username", with: "Ben"
      fill_in "Password", with: "123"
      click_on "Log in"

      visit genres_path

      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
      expect(page).to have_content(genre3.name)
      expect(page).to have_content("Create New Genre")
      expect(page).to have_field("Name")
      expect(page).to have_button("Create Genre")

      fill_in "Name", with: "Techno"
      click_on "Create Genre"

      expect(current_path).to eq(genres_path)
      expect(page).to have_link(genre1.name)
      expect(page).to have_link(genre2.name)
      expect(page).to have_link(genre3.name)
      expect(page).to have_link("Techno")
    end
  end
end
