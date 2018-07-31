require 'rails_helper'

describe Genre, type: :model do
  describe 'validations' do
     it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    it{should have_many(:songs).through(:song_genres)}
  end

  describe 'instance methods' do
    it '#avg_rating' do
      artist = Artist.create(name:'Adele')
      song_1 = artist.songs.create(title: "Don't Stop Believin", length: 303, play_count: 123456, rating: 3)
      song_2 = artist.songs.create(title: "Never Gonna Give You Up", length: 253, play_count: 98762452, rating: 1)
      g_1 = Genre.create(name: 'Dance')
      SongGenre.create(song: song_1, genre: g_1)
      SongGenre.create(song: song_2, genre: g_1)
    
      expect(g_1.avg_rating).to eq(2)       
    end

    it '#highest_rated_song' do
      artist = Artist.create(name:'Adele')
      song_1 = artist.songs.create(title: "Don't Stop Believin", length: 303, play_count: 123456, rating: 3)
      song_2 = artist.songs.create(title: "Never Gonna Give You Up", length: 253, play_count: 98762452, rating: 1)
      g_1 = Genre.create(name: 'Dance')
      SongGenre.create(song: song_1, genre: g_1)
      SongGenre.create(song: song_2, genre: g_1)
    
      expect(g_1.highest_rated_song).to eq(song_1)       
    end
  end
end
