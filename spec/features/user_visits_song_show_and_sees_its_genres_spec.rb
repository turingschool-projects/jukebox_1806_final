require 'rails_helper'

describe 'visitor visits song show page' do
  it 'display genres that the song belongs to' do
    genre1 = Genre.create(name: 'Pop')
    genre2 = Genre.create(name: 'Rap')
    artist = Artist.create(name: 'The One Artist')
    song1 = Song.create!(title: 'Superfreak', length: 300, play_count: 5000000, artist_id: artist.id)
    song2 = Song.create!(title: 'RAP SONG', length: 300, play_count: 5000000, artist_id: artist.id)
    genre1= song1.genres.create!(name:'Folk')
    genre2= song1.genres.create!(name:'Angry Music')
    genre3= song2.genres.create!(name: 'A bop')


    visit song_path(song1.slug)
    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
    expect(page).to_not have_content(genre3.name)

  end
end
