require 'rails_helper'

describe 'visits song show page' do
  describe 'as a visitor' do
    it 'shows a numeric rating for this song' do
      artist = Artist.create(name: "Bob")
      song = artist.songs.create!(title: "A",
                                  length: 100,
                                  play_count: 50,
                                  rating: 5)

      visit song_path(song.slug)

      expect(page).to have_content(song.rating)

    end
  end
end
