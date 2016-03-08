require 'rails_helper'

RSpec.feature 'user signs up' do

  context 'with correct credentials' do
    it 'redirect to links path' do
      visit root_path
      click_link('Sign Up')

      fill_in 'user_email', with: 'test@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Submit'

      expect(current_path).to eq(links_path)
      expect(page).to have_content('Signed Up')
    end
  end

  context 'with bad credentials' do
    it 'requires an email' do
      visit root_path
      click_link('Sign Up')
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Submit'

      expect(current_path).to eq(signup_path)
      expect(page).to have_content('Please Try Again.')
    end

    it 'requires a unique email' do
      User.create!(email: 'test@example.com', password: 'password')
      visit root_path
      click_link('Sign Up')
      fill_in 'user_email', with: 'test@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Submit'

      expect(current_path).to eq(signup_path)
      expect(page).to have_content('Please Try Again.')
    end

    it 'requires a password' do
      visit root_path
      click_link('Sign Up')
      fill_in 'user_email', with: 'test@example.com'
      click_button 'Submit'

      expect(current_path).to eq(signup_path)
      expect(page).to have_content('Please Try Again.')
    end
  end
end