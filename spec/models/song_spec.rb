require 'rails_helper'

describe Song, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:title)}
    it{should validate_presence_of(:length)}
    it{should validate_presence_of(:play_count)}
    it { should validate_numericality_of(:rating).is_greater_than_or_equal_to(0)}
    it { should validate_numericality_of(:rating).is_less_than_or_equal_to(5)}
  end

  describe 'relationships' do
    it{should belong_to(:artist)}
    it{should have_many(:genres).through(:song_genres)}
  end

  describe 'instance methods' do
    it '#three_songs_with_same_rating' do
      artist = Artist.create(name: 'Journey')
      song_1 = artist.songs.create(title: "Don't Stop Believing", length: 320, play_count: 390808, rating: 5)
      song_2 = artist.songs.create(title: "Anyway You Want It", length: 420, play_count: 67908, rating: 5)
      song_3 = artist.songs.create(title: "Heloo", length: 420, play_count: 67908, rating: 5)
      song_4 = artist.songs.create(title: "gfdsasdfgf", length: 420, play_count: 67908, rating: 5)
      song_5 = artist.songs.create(title: "gkjhgfdf", length: 420, play_count: 67908, rating: 4)

      expect(song_1.three_songs_with_same_rating).to eq([song_2, song_3, song_4])
    end
  end
end
