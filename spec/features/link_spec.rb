require 'rails_helper'

RSpec.feature 'user creates links' do

  before :each do
    User.create(email: 'test@example.com', password: 'password')
    visit root_path
    click_link('Login')
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password'
    click_button 'Login'
  end

  context 'with valid credentials' do
    it 'can add new links' do
      visit links_path
      fill_in 'link_title', with: 'Test Link'
      fill_in 'link_url', with: 'http://google.com'
      click_button 'Submit'

      expect(page).to have_content 'Test Link'
      expect(page).to have_content 'http://google.com'
      expect(current_path).to eq links_path
    end

    it 'can display all links' do
      visit links_path
      fill_in 'link_title', with: 'Test Link 1'
      fill_in 'link_url', with: 'http://google.com'
      click_button 'Submit'
      fill_in 'link_title', with: 'Test Link 2'
      fill_in 'link_url', with: 'http://steampowered.com'
      click_button 'Submit'

      expect(page).to have_content 'http://google.com'
      expect(page).to have_content 'http://steampowered.com'
    end

    it 'can update links status' do
      fill_in 'link_title', with: 'Test Link'
      fill_in 'link_url', with: 'http://google.com'
      click_button 'Submit'

      expect(current_path).to eq links_path
      within('li') do
        click_on 'Mark as Read'
      end
      expect(page).to have_selector 'input[type=submit][value="Mark as Unread"]'

      within('li') do
        click_on 'Mark as Unread'
      end
      expect(page).to have_selector 'input[type=submit][value="Mark as Read"]'
    end

    it 'can be edited' do
      fill_in 'link_title', with: 'Test Link'
      fill_in 'link_url', with: 'http://google.com'
      click_button 'Submit'

      within('li') do
        click_on 'Edit'
      end

      fill_in 'link_title', with: 'New Test Link'
      fill_in 'link_url', with: 'http://steampowered.com'
      click_on 'Update'

      expect(page).to have_content 'http://steampowered.com'
    end
  end

  context 'with invalid credentials' do
    it 'must have a title' do
      fill_in 'link_url', with: 'http://google.com'
      click_button 'Submit'

      expect(page).to have_content 'Did not Save'
      expect(page).to_not have_content 'http://google.com'
    end

    it 'must have a valid url' do
      fill_in 'link_title', with: 'Google'
      click_button 'Submit'

      expect(page).to have_content 'Did not Save'
      expect(page).to_not have_content 'Google'
    end


    it 'must have a valid url when editing' do
      fill_in 'link_title', with: 'Test Link'
      fill_in 'link_url', with: 'http://google.com'
      click_button 'Submit'

      within('li') do
        click_on 'Edit'
      end

      fill_in 'link_title', with: 'New Test Link'
      fill_in 'link_url', with: 'steampowered.com'
      click_on 'Update'

      expect(page).to_not have_content 'http://steampowered.com'
    end
  end
end
