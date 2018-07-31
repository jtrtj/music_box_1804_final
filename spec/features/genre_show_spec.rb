require 'rails_helper'

describe 'A visitor' do
  describe 'going to a genre show page' do
    it 'will see all the songs associated with that genre' do
      artist = Artist.create(name:'Adele')
      song_1 = artist.songs.create(title: "Don't Stop Believin", length: 303, play_count: 123456)
      song_2 = artist.songs.create(title: "Never Gonna Give You Up", length: 253, play_count: 98762452)
      song_3 = artist.songs.create(title: "Hey ya", length: 2543, play_count: 9865452)
      g_1 = Genre.create(name: 'Dance')
      g_2 = Genre.create(name: 'Woohoo')
      SongGenre.create(song: song_1, genre: g_1)
      SongGenre.create(song: song_2, genre: g_1)
      SongGenre.create(song: song_3, genre: g_2)

      visit genre_path(g_1)

      expect(page).to have_content(song_1.title)
      expect(page).to have_content(song_2.title)
      expect(page).to_not have_content(song_3.title)
    end

    it 'will see the average rating for all songs in the genre' do
      artist = Artist.create(name:'Adele')
      song_1 = artist.songs.create(title: "Don't Stop Believin", length: 303, play_count: 123456, rating: 3)
      song_2 = artist.songs.create(title: "Never Gonna Give You Up", length: 253, play_count: 98762452, rating: 1)
      song_3 = artist.songs.create(title: "Hey ya", length: 2543, play_count: 9865452, rating: 5)
      g_1 = Genre.create(name: 'Dance')
      g_2 = Genre.create(name: 'Woohoo')
      SongGenre.create(song: song_1, genre: g_1)
      SongGenre.create(song: song_2, genre: g_1)
      SongGenre.create(song: song_3, genre: g_2)

      visit genre_path(g_1)

      expect(page).to have_content("Average Rating: #{g_1.avg_rating}/5")
    end
  end
end
