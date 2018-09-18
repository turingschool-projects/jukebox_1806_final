require "rails_helper"

describe "As a visitor" do
  describe "when I visit the genre index page" do
    it "should show all genres on page" do
      genre1 = Genre.create(name: "Pop")
      genre2 = Genre.create(name: "Funk")
      genre3 = Genre.create(name: "Dance")

      visit genres_path

      expect(page).to_not have_content("Create New Genre")
      expect(page).to_not have_field("Name")
      expect(page).to_not have_button("Create Genre")

      expect(page).to have_link(genre1.name)
      expect(page).to have_link(genre2.name)
      expect(page).to have_link(genre3.name)
    end
  end
  describe "when I visit a genre show page" do
    it "should show me all songs for that genre" do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")

      song_1 = artist_1.songs.create!( title: 'Superfreak',
                                      length: 300,
                                      play_count: 5000000,
                                      artist: artist_1
                                    )
      song_2 = artist_1.songs.create!( title: 'Superfreak 2',
                                      length: 200,
                                      play_count: 10000,
                                      artist: artist_2,
                                      rating: 3
                                    )
      song_3 = artist_2.songs.create!( title: 'Ice Ice Baby',
                                      length: 200,
                                      play_count: 10000,
                                      artist: artist_2,
                                      rating: 3
                                    )
      genre = Genre.create(name: "Freaks")

      genre.songs << song_1
      genre.songs << song_2

      visit genre_path(genre)

      expect(page).to have_content(song_1.title)
      expect(page).to have_content(song_2.title)
      expect(page).to_not have_content(song_3.title)
    end
    it "should show me the average rating for songs in this genre" do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")

      song_1 = artist_1.songs.create!( title: 'Superfreak',
                                      length: 300,
                                      play_count: 5000000,
                                      artist: artist_1
                                    )
      song_2 = artist_1.songs.create!( title: 'Superfreak 2',
                                      length: 200,
                                      play_count: 10000,
                                      artist: artist_2,
                                      rating: 3
                                    )
      song_3 = artist_2.songs.create!( title: 'Ice Ice Baby',
                                      length: 200,
                                      play_count: 10000,
                                      artist: artist_2,
                                      rating: 3
                                    )
      genre = Genre.create(name: "Freaks")

      genre.songs << song_1
      genre.songs << song_2

      visit genre_path(genre)

      expect(page).to have_content("Average Rating: 2.0")
    end
  end
end
