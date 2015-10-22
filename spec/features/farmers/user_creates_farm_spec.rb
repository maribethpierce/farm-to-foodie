require 'rails_helper'

feature 'farmer can add farm', %{
  As a signed up user (with a farm)
  I want to be add my farm
  so that I can have my details available to the public

  Acceptance Criteria
  [] - As a farmer, I can see the form to add details re: my farm
  [] - As a farmer, I can fill out the form and save my details
  [] - I get error messages if I fill out the form incorrectly
  [] - I can only add one farm
} do

  feature "User can access the form to add a farm" do

  #   before(:each) do
  #     @user = FactoryGirl.create(:user)
  #     @user1 = FactoryGirl.create(:user)
  #     @user2 = FactoryGirl.create(:user)
  #     visit new_user_session_path
  #     fill_in 'Email', with: @group.user.email
  #     fill_in 'Password', with: @group.user.password
  #     click_button 'Log in'
  #   end
  #
  #   scenario "User can navigate to group show page" do
  #     visit root_path
  #     click_link "My Groups"
  #     expect(page).to have_content(@group.name)
  #   end
  #
  #   scenario "User can see group information" do
  #     visit root_path
  #     click_link "My Groups"
  #     click_link (@group.name)
  #
  #     expect(page).to have_content(@group.name)
  #     expect(page).to have_content(@group.description)
  #   end
  #
  #   scenario "User adds members to group" do
  #     visit root_path
  #     click_link "My Groups"
  #     click_link @group.name
  #     click_link 'Add Group Members'
  #     check(@user.name)
  #     check(@user1.name)
  #     check(@user2.name)
  #     click_button 'Add these members'
  #
  #     expect(page).to have_content('Members added!')
  #     expect(page).to have_content(@user.name)
  #     expect(page).to have_content(@user1.name)
  #     expect(page).to have_content(@user2.name)
  #   end
  end
end
