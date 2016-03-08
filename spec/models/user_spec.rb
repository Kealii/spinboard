require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(email: "test@example.com",
                    password: "password",
                    password_confirmation: "password")
    expect(user).to be_valid
  end

  it "is invalid without a password" do
    user = User.new(email: "test@example.com",
                    password_confirmation: "password")
    expect(user).to be_invalid
  end

  it "is invalid without an email" do
    user = User.new(password: "password",
                    password_confirmation: "password")
    expect(user).to be_invalid
  end

  it "is invalid if email not unique" do
    User.create(email: "test@example.com", password: "password")
    user = User.new(email: "test@example.com",
                    password: "pass",
                    password_confirmation: "pass")
    expect(user).to be_invalid
  end
end