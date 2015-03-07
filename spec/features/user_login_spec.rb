require 'rails_helper'

RSpec.describe "User tries to login" do
  xit "cannot sign in if not registered" do
    visit login_path
    fill_in 'session[user_name]', with: "sdf"
    fill_in 'session[password]', with: "sdf"
    click_link_or_button 'Sign In'
    expect(page).to have_content('Invalid')
  end

  xit 'cannot sign in without a valid password' do
    user = User.create(user_name: 'Miriam', password: 'Joy')
    visit login_path
    fill_in 'session[user_name]', with: "Miriam"
    fill_in 'session[password]', with: "Josdf"
    click_link_or_button 'Sign In'
    expect(page).to have_content('Invalid')
  end

  xit "can sign in if valid" do
    user = User.create(user_name: 'Miriam', password: 'Joy')
    visit login_path
    fill_in 'session[user_name]', with: "Miriam"
    fill_in 'session[password]', with: "Joy"
    click_link_or_button 'Sign In'
    expect(page).to have_content('Welcome')
  end

  xit 'can sign out once logged in' do
    user = User.create(user_name: 'Miriam', password: 'Joy')
    visit login_path
    fill_in 'session[user_name]', with: "Miriam"
    fill_in 'session[password]', with: "Joy"
    click_link_or_button 'Sign In'
    click_link_or_button 'Log Out'
    expect(page).to have_content('Goodbye')
  end
end
