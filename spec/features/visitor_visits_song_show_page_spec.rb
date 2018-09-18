require 'rails_helper'

describe "As an unregistered user" do
  describe "when I visit the song show page" do
    it "Should display the numeric rating for this song" do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")

      song_1 = artist_1.songs.create!( title: 'Superfreak',
                                      length: 300,
                                      play_count: 5000000,
                                      artist: artist_1
                                    )
      song_2 = artist_2.songs.create!( title: 'Ice Ice Baby',
                                      length: 200,
                                      play_count: 10000,
                                      artist: artist_2,
                                      rating: 3
                                    )

      visit song_path(song_1.slug)
      expect(page).to have_content("Rating: #{song_1.rating}")

      visit song_path(song_2.slug)
      expect(page).to have_content("Rating: #{song_2.rating}")
    end
  end
end
