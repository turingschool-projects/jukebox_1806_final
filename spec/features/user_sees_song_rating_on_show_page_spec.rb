require 'rails_helper'

describe 'visitor visits song show page' do
  it 'displays song rating' do
    artist_1 = Artist.create(name: "Rick James")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 1)
    visit song_path(song_1.slug)

    expect(page).to have_content(song_1.rating)
  end
end
