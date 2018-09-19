require 'rails_helper'

describe 'song slugs' do
  describe 'user can find songs by a slug instead of integer id' do
    it 'should find the correct song' do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")
      song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 5)
      song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000, rating: 4)

      visit song_path(song_1.slug)

      expect(page).to have_content(song_1.title)
      expect(page).to have_content(song_1.artist.name)
    end
  end
end
