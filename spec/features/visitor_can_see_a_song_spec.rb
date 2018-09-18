require 'rails_helper'

describe 'song show' do
  it 'visitor can see a song with rating' do
    artist_1 = Artist.create(name: "Rick James")
    song = artist_1.songs.create!(title: 'Superfreak', length: 300, play_count: 5000000, rating: 1)

    visit song_path('superfreak')

    expect(page).to have_content(song.title)
    expect(page).to have_content(song.rating)
  end
end
