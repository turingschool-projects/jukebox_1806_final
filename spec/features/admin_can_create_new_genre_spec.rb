require 'rails_helper'

describe 'as an admin' do
  describe 'visiting genre index page' do
    before (:each) do
      @genre_1 = Genre.create(name: "Rock")
      @genre_2 = Genre.create(name: "Classical")
      @admin = User.create(username: "bill", password: "test", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end
    it "should allow admin to create new genre" do
      visit genres_path

      click_on 'Create New Genre'
      expect(current_path).to eq(new_admin_genre_path)

      fill_in 'Name', with: "Pop"
      click_on 'Create Genre'

      expect(current_path).to eq(genres_path)
      expect(page).to have_content("Pop")
    end
  end
end
