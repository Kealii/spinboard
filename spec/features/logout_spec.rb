require 'rails_helper'

RSpec.feature 'user logs out' do
  it 'redirects to link index' do
    User.create(email: 'test@example.com', password: 'password')

    visit root_path
    click_link('Login')
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password'
    click_button 'Login'
    click_link 'Logout'

    expect(page).to_not have_content('test@example.com')
    expect(current_path).to eq root_path
  end

end