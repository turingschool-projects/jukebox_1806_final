require 'rails_helper'

describe "User visits genre index" do
  context "as an admin" do
    it "allows admin to create a new category" do
      admin = User.create(username: "Ian", password: "test123", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      fill_in :genre_name, with: "Trip Hop"
      click_on('Create Genre')

      expect(current_path).to eq(genres_path)
      expect(page).to have_content("Trip Hop")
    end
  end
    context 'as a user' do
      it 'does not render form for new genre' do
        genre_1 = Genre.create!(name: 'Hip Hop')
        genre_2 = Genre.create!(name: 'Country')
        artist_1 = Artist.create!(name: 'Afroman')
        artist_2 = Artist.create!(name: 'Johnny Cash')
        genre_1.songs.create!(title: 'colt 45', length: 100, play_count: 100, artist_id: artist_1.id)
        genre_1.songs.create!(title: 'Because I Got High', length: 100, play_count: 100, artist_id: artist_1.id)
        genre_2.songs.create!(title: 'hurt', length: 100, play_count: 100, artist_id: artist_2.id)


        visit genres_path
        expect(page).to_not have_field(:name)
        click_on('Hip Hop')

        expect(current_path).to eq(genre_path(genre_1))
        expect(page).to have_content(genre_1.songs.first.title)
        expect(page).to have_content(genre_1.songs.last.title)
        expect(page).to_not have_content(genre_2.songs.first.title)
      end
    end
end
