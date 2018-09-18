require 'rails_helper'

describe 'as a visitor' do
  describe 'viewing genre index page' do
    before (:each) do
      @genre_1 = Genre.create(name: "Rock")
      @genre_2 = Genre.create(name: "Classical")
    end
    it "should list all genres" do
      visit genres_path

      expect(page).to have_content("All Genres")
      expect(page).to have_content(@genre_1.name)
      expect(page).to have_content(@genre_2.name)
    end
  end
end
