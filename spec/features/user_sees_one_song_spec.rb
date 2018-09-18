require 'rails_helper'

describe 'user visits song show page' do
  it 'displays numeric rating for song' do
    artist_1 = Artist.create(name: "Rick James")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 5)

    visit song_path(song_1.slug)
    save_and_open_page

    expect(page).to have_content("Rating for #{song_1.title}: #{song_1.rating}")

  end
end
