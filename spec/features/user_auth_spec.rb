require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let(:administrator) do
    User.create(name: 'Richard', password: 'hi', role: 1)
  end
  let(:user1) do
    User.create(name: 'Richie', password: 'hi', role: 0)
  end
  let(:user2) do
    User.create(name: 'Rich', password: 'hi', role: 0)
  end
  describe "when an admin is logged in" do
    xit "is able to see info for all users" do
      ApplicationController.any_instance.stub(:current_user).and_return(administrator)
      # allow_any_instance_of(User).to receive(:current_user).and_return(administrator)
      visit '/points'
      assert page.has_content?(5)
      assert page.has_content?(10)
      # And I can edit points for all users
      # Then I can destroy points for all users
      # expect(page).to have_content('Crab')
    end
  end

  describe "when a user is logged in" do
    it "can see their points" do
      ApplicationController.any_instance.stub(:current_user).and_return(user1)
      visit '/dashboard'
      expect(page).to have_content('Points')
    end
  end

  describe "when a user is not logged in" do
    it "cannot see the dashboard" do
      visit '/dashboard'
      expect(page).to have_content("You must sign in to see this information.")
    end
  end

end

# RSpec.describe "User creates a song" do
#   let(:user) do
#     User.create(username: 'Paul', password: 'test')
#   end
#   context "with valid attributes" do
#     it "saves and displays the song title" do
#       ApplicationController.any_instance.stub(:current_user).and_return(user)
#       visit new_song_path
#       fill_in('Artist', :with => 'Weezer')
#       fill_in('Title', :with => 'Crab')
#       click_link_or_button("Update Song")
#       expect(page).to have_content('Crab')
#     end
#   end
# end
