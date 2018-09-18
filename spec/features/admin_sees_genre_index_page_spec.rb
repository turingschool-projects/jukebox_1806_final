require 'rails_helper'

describe 'genre index' do
  it 'admin can create new genres' do
    admin = User.create(username: "Ian", password: "test123", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    artist_1 = Artist.create(name: "Rick James")
    artist_2 = Artist.create(name: "Vanilla Ice")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000)
    song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)
    genre_1 = Genre.create(title: "Funk", songs: [song_1])
    genre_2 = Genre.create(title: "Rap", songs: [song_2])

    visit genres_path

    expect(page).to have_content(genre_1.title)
    expect(page).to have_content(genre_2.title)

    fill_in :genre_title, with: "test"

    click_on 'Create Genre'

    expect(current_path).to eq(genres_path)
    expect(page).to have_content("Create New Genre Here")
    expect(page).to have_button("Create Genre")
    expect(Genre.last.title).to eq("test")
    expect(page).to have_content(Genre.last.title)
  end
end
describe 'genre index' do
  it 'visitor cannot create new genres thru genre index' do

    artist_1 = Artist.create(name: "Rick James")
    artist_2 = Artist.create(name: "Vanilla Ice")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000)
    song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)
    genre_1 = Genre.create(title: "Funk", songs: [song_1])
    genre_2 = Genre.create(title: "Rap", songs: [song_2])

    visit genres_path

    expect(page).to have_content(genre_1.title)
    expect(page).to have_content(genre_2.title)
    expect(current_path).to eq(genres_path)
    expect(page).to_not have_content("Create New Genre Here")
    expect(page).to_not have_button("Create Genre")
  end
end
