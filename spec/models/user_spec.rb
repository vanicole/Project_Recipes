require 'rails_helper'

RSpec.describe User, type: :model do

  it "Validate User" do
    user = User.new(:email => "user@test.it", :password => "12345678")
    expect(user).to be_valid
  end

  it "Missing Password" do
    user = User.new(:email => "user@test.it")
    expect(user).not_to be_valid
  end

  it "Missing Email" do
    user = User.new(:password => "12345678")
    expect(user).not_to be_valid
  end

  it "Existing Email as Username" do
    user = User.create(:email => "user@test.it", :password => "12345678")
    user2 = User.create(:email => "user@test.it", :password => "12345678", :password_confirmation => "12345678")
    expect(user2).not_to be_valid
  end
end
