require 'rails_helper'

describe 'visitor visits genre show page' do
  it 'display genre songs' do
    genre1 = Genre.create(name: 'Pop')
    genre2 = Genre.create(name: 'Rap')
    artist = Artist.create(name: 'The One Artist')
    song1 = genre1.songs.create!(title: 'Superfreak', length: 300, play_count: 5000000, artist_id: artist.id)
    song2 = genre1.songs.create!(title: 'Hey Mama', length: 300, play_count: 5000000, artist_id: artist.id)
    song3 = genre2.songs.create!(title: 'RAP SONG', length: 300, play_count: 5000000, artist_id: artist.id)

    visit genre_path(genre1)
    
    expect(page).to have_content(song1.title)
    expect(page).to have_content(song2.title)
    expect(page).to_not have_content(song3.title)

  end
end
