# As a Visitor,
#   When I visit the genre index page,
#     I see all genres in the database.
require 'rails_helper'

describe 'genre index' do
  it 'user can see all genres' do
    # artist_1 = Artist.create(name: "Rick James")
    # artist_2 = Artist.create(name: "Vanilla Ice")
    # song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000)
    # song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)
    genre_1 = Genre.create!(name: "Folk")
    genre_2 = Genre.create!(name: "Jazz")
    # genre_1 << song_1
    # genre_2 << song_2

    visit genres_path

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
  end
end
