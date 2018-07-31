require 'rails_helper'

describe Genre, type: :model do
  describe 'validations' do
     it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    # it { should belong_to(:) }
    # it { should have_many(:) }
    # it { should have_many(:).through(:) }
  end

  describe 'instance methods' do
    
  end

  describe 'class methods' do
    
  end
end
