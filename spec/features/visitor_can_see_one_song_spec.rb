require 'rails_helper'

describe 'song show' do
  it "user can see one song" do
    artist_1 = Artist.create(name: "Rick James")
    artist_2 = Artist.create(name: "Vanilla Ice")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 4)
    song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000, rating: 1)

    visit song_path(song_1.slug)

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content("Rating: #{song_1.rating}")
    expect(page).to_not have_content(song_2.title)
    expect(page).to_not have_content("Play Count: #{song_2.play_count}")
    expect(page).to_not have_content("Rating: #{song_2.rating}")
  end

  it "user can see one song" do
    artist_1 = Artist.create(name: "Rick James")
    artist_2 = Artist.create(name: "Vanilla Ice")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 4)
    song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000, rating: 1)
    genre_1 = song_1.genres.create(name: 'Funky')
    genre_2 = song_1.genres.create(name: "80's")
    genre_3 = song_2.genres.create(name: "Rap")

    visit song_path(song_1.slug)

    expect(page).to have_content("Genres for this song")
    expect(page).to have_content("Funky")
    expect(page).to have_content("80's")
    expect(page).to_not have_content("Rap")

  end
end
