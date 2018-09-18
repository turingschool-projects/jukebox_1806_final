require 'rails_helper'

describe 'as a visitor' do
  describe 'visiting genre index page' do
    before (:each) do
      @genre_1 = Genre.create(name: "Rock")
      @genre_2 = Genre.create(name: "Classical")
    end
    it "should not let visitor see create new genre button" do
      visit genres_path

      expect(page).to_not have_link("Create New Genre")
    end
  end
end
