require 'rails_helper'

describe 'a visitor' do
  describe 'visiting genre index' do
    it 'will see a list of all genres' do
      g_1 = Genre.create(name: 'Dance')
      g_2 = Genre.create(name: 'Hardcore')
      g_3 = Genre.create(name: 'Emo')
      g_4 = Genre.create(name: 'Alt')
   
      visit genres_path

      expect(page).to have_content(g_1.name)
      expect(page).to have_content(g_2.name)
    end
  end
end
