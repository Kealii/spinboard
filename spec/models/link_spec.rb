require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:user) { User.create(email: 'test_user', password: 'password') }

  it 'should be valid' do
    link = Link.new(title: 'Test Title', url: 'http://www.google.com', user_id: user.id)
    expect(link).to be_valid
  end

  it 'should be invalid without a title' do
    link = Link.new(url: 'http://www.google.com', user_id: user.id)
    expect(link).to be_invalid
  end

  it 'should be invalid without a valid url' do
    link = Link.new(title: 'Test Title', url: 'Test URL', user_id: user.id)
    expect(link).to be_invalid
  end

  it 'should have a default read status of false' do
    link = Link.new(title: 'Test Title', url: 'http://www.google.com', user_id: user.id)
    expect(link.read).to eq false
  end
end