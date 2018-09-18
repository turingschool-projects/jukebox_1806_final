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
      expect(page).to have_content("Genres")
      expect(page).to have_content(song.genres.first.name)
      expect(page).to have_content(song_2.genres.first.name)
      expect(page).to have_css(".new_genre")
    end
  end

  context "as a default user" do
    it "does not allow default user to see new genre form" do
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
      user = User.create(username: "Dione", password: "test123")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit genres_path

      expect(page).to have_content(song.genres.first.name)
      expect(page).to have_content(song_2.genres.first.name)
      expect(page).to_not have_css(".new_genre")
    end
  end
end
