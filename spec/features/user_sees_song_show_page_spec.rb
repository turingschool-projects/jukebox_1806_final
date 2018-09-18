require 'rails_helper'

describe 'user visits song show page' do
  it "shows song rating" do
    artist_1 = Artist.create(name: "Rick James")
    artist_2 = Artist.create(name: "Vanilla Ice")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 5)

    visit song_path(song_1.slug)

    expect(page).to have_content("Rating: #{song_1.rating}")
  end
  it "shows genres for this show" do
    artist = Artist.create(name: "Prince")
    song_1 = artist.songs.create(title: "Purple Rain", length: 209, play_count: 3445, rating:5)
    song_2 = artist.songs.create(title: "When Doves Cry", length: 209, play_count: 3445, rating:5)
    genre_1 = Genre.create(name: "Rock")
    genre_2 = Genre.create(name: "Jazz")


    genre_1.songs << [song_1, song_2]
    genre_2.songs << [song_1, song_2]

    visit song_path(song_1.slug)

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
  end

end
