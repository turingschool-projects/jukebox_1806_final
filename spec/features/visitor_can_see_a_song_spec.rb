require 'rails_helper'

describe 'song show' do
  it 'visitor can see a song with rating' do
    artist_1 = Artist.create(name: "Rick James")
    song = artist_1.songs.create!(title: 'Superfreak', length: 300, play_count: 5000000, rating: 1)

    visit song_path(song.slug)

    expect(page).to have_content(song.title)
    expect(page).to have_content(song.rating)
  end
  
  it 'visitor can see genres for the Song' do 
    artist = Artist.create(name: "Prince")
    song_1 = artist.songs.create(title: "Purple Rain", length: 209, play_count: 3445)
    song_2 = artist.songs.create(title: "Purple Snow", length: 209, play_count: 3445)
    genre_1 = song_1.genres.create(name: 'Jazz')
    genre_2 = song_1.genres.create(name: 'Blues')
    genre_3 = song_2.genres.create(name: 'House')
    
    visit song_path(song_1.slug)
    
    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
    expect(page).to_not have_content(genre_3.name)
    save_and_open_page
  end
end
