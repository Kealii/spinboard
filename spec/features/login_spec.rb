require 'rails_helper'

RSpec.feature 'user logs in' do

  before :each do
    User.create(email: 'test@example.com', password: 'password')
  end

  context 'with valid credentials' do
    it 'redirects to link index' do
      visit root_path
      click_link('Login')
      fill_in 'email', with: 'test@example.com'
      fill_in 'password', with: 'password'
      click_button 'Login'

      expect(page).to have_content('test@example.com')
      expect(current_path).to eq(links_path)
    end
  end

  context 'with invalid credentials' do
    it 'redirects to login path with bad password' do
      visit root_path
      click_link('Login')
      fill_in 'email', with: 'test@example.com'
      fill_in 'password', with: 'notpassword'
      click_button 'Login'

      expect(page).to_not have_content('test@example.com')
      expect(current_path).to eq(login_path)
    end

    it 'redirects to login path with bad email' do
      visit root_path
      click_link('Login')
      fill_in 'email', with: 'nottest@example.com'
      fill_in 'password', with: 'password'
      click_button 'Login'

      expect(page).to_not have_content('test@example.com')
      expect(current_path).to eq(login_path)
    end
  end
end