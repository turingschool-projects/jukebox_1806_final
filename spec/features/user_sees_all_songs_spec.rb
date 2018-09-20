require 'rails_helper'

describe 'song index' do
  it 'user can see all songs' do
    artist_1 = Artist.create(name: "Rick James")
    artist_2 = Artist.create(name: "Vanilla Ice")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000)
    song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)

    visit songs_path

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end

  it 'displays awards for each song with year of award' do
    artist_1 = Artist.create(name: "Rick James")
    artist_2 = Artist.create(name: "Vanilla Ice")
    song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000)
    song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)
    award_1 = Award.create!(name: "Award 1")
    award_2 = Award.create!(name: "Award 2")
    song_award1 = SongAward.create!(song_id: song_1.id, award_id: award_1.id, year: 2018)
    song_award2 = SongAward.create!(song_id: song_1.id, award_id: award_2.id, year: 2018)
    song_award3 = SongAward.create!(song_id: song_2.id, award_id: award_1.id, year: 2018)
    song_award4 = SongAward.create!(song_id: song_2.id, award_id: award_2.id, year: 2018)

    visit song_path(song_1.slug)
    save_and_open_page

    expect(page).to have_content("Award 1 2018")
    expect(page).to have_content("Award 2 2018")
  end
end
