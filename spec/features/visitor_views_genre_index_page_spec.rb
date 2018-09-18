require "rails_helper"

describe "As a visitor" do
  describe "when I visit the genre index page" do
    it "should show all genres on page" do
      genre1 = Genre.create(name: "Pop")
      genre2 = Genre.create(name: "Funk")
      genre3 = Genre.create(name: "Dance")

      visit genres_path

      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
      expect(page).to have_content(genre3.name)
    end
  end
end
