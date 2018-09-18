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
    it "should show the genres for song on show page" do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")

      song_1 = artist_1.songs.create!( title: 'Superfreak',
                                      length: 300,
                                      play_count: 5000000,
                                      artist: artist_1
                                    )
      song_3 = artist_2.songs.create!( title: 'Ice Ice Baby',
                                      length: 200,
                                      play_count: 10000,
                                      artist: artist_2,
                                      rating: 3
                                    )
      genre_1 = Genre.create(name: "Freaks")
      genre_2 = Genre.create(name: "Geeks")
      genre_3 = Genre.create(name: "Rock")

      song_1.genres << genre_1
      song_1.genres << genre_2

      visit song_path(song_1.slug)
      expect(page).to have_content("Genres for this Song:")
      expect(page).to have_link(genre_1.name)
      expect(page).to have_link(genre_2.name)
      expect(page).to_not have_link(genre_3.name)
    end
  end
end
