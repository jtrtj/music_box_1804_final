require 'rails_helper'

describe SongGenre, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:song_id) }
    it { should validate_presence_of(:genre_id) }
  end

  describe 'relationships' do
    it { should belong_to(:song) }
    it { should belong_to(:genre) }
  end

  describe 'instance methods' do
    
  end

  describe 'class methods' do
    
  end
end
