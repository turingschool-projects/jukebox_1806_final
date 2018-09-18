require "rails_helper"

describe "As a visitor" do
  describe "when I visit a song show page" do
    it 'should show song rating for the song' do
      artist = Artist.create!(name: "Person")
      song = artist.songs.create!(title: "Song Title", length: 321, play_count: 12244, rating: 4)

      visit song_path(song.slug)

      expect(page).to have_content(song.title)
      expect(page).to have_content("Song Rating: #{song.rating}")
    end
  end
end
