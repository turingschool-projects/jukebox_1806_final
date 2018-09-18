require 'rails_helper'

describe 'user visits genre show' do
  it 'displays associated songs' do
    user = User.create(username: "person", password: "person")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    artist_1 = Artist.create(name: "Rick James")
    artist_2 = Artist.create(name: "Vanilla Ice")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000)
    song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)
    song_3 = artist_2.songs.create(title: 'Another Song', length: 400, play_count: 100)
    genre1 = Genre.create!(name: "Pop")
    genre2 = Genre.create!(name: "Rap")
    song_genre1 = SongGenre.create!(song_id: song_1.id, genre_id: genre1.id)
    song_genre2 = SongGenre.create!(song_id: song_2.id, genre_id: genre1.id)
    song_genre3 = SongGenre.create!(song_id: song_3.id, genre_id: genre2.id)

    visit genre_path(genre1)

    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_2.title)
    expect(page).to_not have_content(song_3.title)
  end

  it 'links from the show page' do
    user = User.create(username: "person", password: "person")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    artist_1 = Artist.create(name: "Rick James")
    artist_2 = Artist.create(name: "Vanilla Ice")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000)
    song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)
    song_3 = artist_2.songs.create(title: 'Another Song', length: 400, play_count: 100)
    genre1 = Genre.create!(name: "Pop")
    genre2 = Genre.create!(name: "Rap")
    song_genre1 = SongGenre.create!(song_id: song_1.id, genre_id: genre1.id)
    song_genre2 = SongGenre.create!(song_id: song_2.id, genre_id: genre1.id)
    song_genre3 = SongGenre.create!(song_id: song_3.id, genre_id: genre2.id)

    visit genres_path

    click_on("#{genre1.name}")
    expect(current_path).to eq(genre_path("#{genre1.name}"))
  end
end
