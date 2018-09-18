require "rails_helper"

describe "User visits genres index" do
  context "as an admin" do
    it "sees everything visitors see and has a form to create new genre" do
      artist = Artist.create(name: "Bob")
      song = artist.songs.create!(title: "A",
                                  length: 100,
                                  play_count: 50,
                                  rating: 5)
      song_2 = artist.songs.create!(title: "B",
                                  length: 100,
                                  play_count: 50,
                                  rating: 5)
      song.genres.create(name: "Dance")
      song_2.genres.create(name: "Theater")

      admin = User.create(username: "Ian", password: "test123", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      fill_in :genre_name, with: "New Genre"
      click_on "Create Genre"

      expect(current_path).to eq(genres_path)
      expect(page).to have_content("New Genre")
    end
  end
end
