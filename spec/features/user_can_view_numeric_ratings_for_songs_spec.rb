require "rails_helper"

describe "User visits song show" do
  context "as a visitor" do
    it "Songs have numeric ratings" do
      artist = Artist.create(name: "Prince")
      song_1 = artist.songs.create(title: "Purple Rain", length: 209, play_count: 3445, number_rating: 3)

      visit song_path(song_1.slug)

      expect(page).to have_content("Rating: #{song_1.number_rating}")
    end
  end
end
