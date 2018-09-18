require "rails_helper"

describe Genre, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "relationships" do
    it { should have_many(:song_genres) }
    it { should have_many(:songs), through: :song_genres }
  end

  describe 'instance methods' do
    context '#avg_song_rating' do
      it 'should return an average rating of all songs in this genre' do
        artist_1 = Artist.create(name: "Rick James")
        artist_2 = Artist.create(name: "Vanilla Ice")
        genre = Genre.create!(name: "Alternative")
        song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 2)
        song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000, rating: 1)
        song_3 = artist_2.songs.create(title: 'Another Song', length: 242, play_count: 33353, rating: 5)
        genre.songs << song_1
        genre.songs << song_2
        genre.songs << song_3

        expect(genre.avg_song_rating).to eq(((song_1.rating + song_2.rating + song_3.rating) / genre.songs.count.to_f).round(2))
      end
    end
  end
end
