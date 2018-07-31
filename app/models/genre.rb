class Genre < ApplicationRecord
  validates_presence_of :name
  has_many :song_genres
  has_many :songs, through: :song_genres

  def avg_rating
    songs.average(:rating)
  end

  def highest_rated_song
    highest_rating = songs.maximum(:rating)
    songs.where(rating: highest_rating).limit(1)[0]
  end
end