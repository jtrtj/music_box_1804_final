require 'rails_helper'

describe 'a visitor' do
  describe 'visiting genre index' do
    it 'will see a list of all genres and their names will be links' do
      g_1 = Genre.create(name: 'Dance')
      g_2 = Genre.create(name: 'Hardcore')
      g_3 = Genre.create(name: 'Emo')
      g_4 = Genre.create(name: 'Alt')
   
      visit genres_path

      expect(page).to have_link(g_1.name)
      expect(page).to have_link(g_2.name)
      expect(page).to have_link(g_3.name)
      expect(page).to have_link(g_4.name)
    end

    it 'will not see form to create new genre' do 
      g_1 = Genre.create(name: 'Dance')
      g_2 = Genre.create(name: 'Hardcore')

      visit genres_path

      expect(page).to_not have_field("Name")
      expect(page).to_not have_button('Create Genre')
      expect(page).to have_link(g_1.name)
      expect(page).to have_link(g_2.name)
    end
  end

  context 'logged in as an admin' do
    it 'will see a form to create a new genre' do
      admin = User.create(username: 'admin', password: 'gasd', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      g_1 = Genre.create(name: 'Dance')
      g_2 = Genre.create(name: 'Hardcore')

      visit genres_path

      expect(page).to have_field("Name")
      expect(page).to have_button('Create Genre')
      expect(page).to have_link(g_1.name)
      expect(page).to have_link(g_2.name)
    end

    it 'can create a new genre' do
      admin = User.create(username: 'admin', password: 'gasd', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      g_1 = Genre.create(name: 'Dance')
      g_2 = Genre.create(name: 'Hardcore')

      visit genres_path

      expect(page).to have_link(g_1.name)
      expect(page).to have_link(g_2.name)

      fill_in :genre_name, with: 'gfds'
      click_button 'Create Genre'
      
      expect(current_path).to eq(genres_path)
      expect(page).to have_link(Genre.last.name)
      expect(page).to have_link(g_1.name)
      expect(page).to have_link(g_2.name)
    end
  end
end
