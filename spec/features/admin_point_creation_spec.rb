require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "when an admin adds points" do
    it "is able to add points for all users" do
      # ApplicationController.any_instance.stub(:current_user).and_return(administrator)
      # allow_any_instance_of(User).to receive(:current_user).and_return(administrator)
      User.create(name: 'Miriam', password: 'Joy', role: 1)
      user1 = User.create(name: 'Richie', password: 'hi', role: 0, available_points: 5)
      visit login_path
      fill_in 'session[user_name]', with: "Miriam"
      fill_in 'session[password]', with: "Joy"
      click_link_or_button 'Sign In'
      visit '/admin'
      # all('Edit Points')[1].click
      # click_link_or_button 'Edit Points'
      expect(page).to have_content("Richie")
      expect(page).to have_content(5)



      # And I can edit points for all users
      # Then I can destroy points for all users
      # expect(page).to have_content('Crab')
    end
  end
end
