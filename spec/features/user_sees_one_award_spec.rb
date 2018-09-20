require 'rails_helper'

describe 'user sees one award' do
  context 'as a visitor' do
    it 'displays all songs that received award with year' do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")
      song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000)
      song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)
      song_3 = artist_2.songs.create(title: 'Hello', length: 700, play_count: 100)
      award_1 = Award.create!(name: "Award 1")
      award_2 = Award.create!(name: "Award 2")
      song_award1 = SongAward.create!(song_id: song_1.id, award_id: award_1.id, year: 2018)
      song_award2 = SongAward.create!(song_id: song_1.id, award_id: award_2.id, year: 2018)
      song_award3 = SongAward.create!(song_id: song_2.id, award_id: award_1.id, year: 2018)
      song_award4 = SongAward.create!(song_id: song_2.id, award_id: award_2.id, year: 2018)

      visit award_path(award_1)

      expect(page).to have_content("Superfreak 2018")
      expect(page).to have_content("Ice Ice Baby 2018")
      expect(page).to_not have_content("Hello 2018")

    end
  end
end
