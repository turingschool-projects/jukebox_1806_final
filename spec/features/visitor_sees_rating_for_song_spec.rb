require 'rails_helper'

describe "As a visitor" do
  context "they visit a song show page" do
    it "displays the rating for the song" do
      artist_1 = Artist.create(name: "Rick James")
      song_1 = artist_1.songs.create!(title: 'Superfreak', length: 300, play_count: 5000000, rating: 5)

      visit song_path(song_1.slug)

      expect(page).to have_content("Rating: 5")
    end
  end
end
