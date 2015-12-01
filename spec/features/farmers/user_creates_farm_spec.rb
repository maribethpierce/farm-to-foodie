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

    before(:each) do
      @user = FactoryGirl.create(:user)

      visit new_user_session_path

      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password

      click_button 'Log in'
      click_link('Update my Info')

      check('user_farmer')
      fill_in 'user_current_password', with: @user.password
      click_button('Update')
    end

    scenario "User registered as farmer can create farm listing" do
      visit root_path
      click_link "List My Farm"

      expect(page).to have_content("List your farm:")
    end

    scenario "User registered as farmer can lists their farm" do
      visit root_path
      click_link "List My Farm"
      fill_in "farm_name", with: "Happy Farm"
      fill_in "farm_email", with: "happy@farm.com"
      fill_in "farm_phone", with: "1232343456"
      fill_in "farm_address", with: "234 School Rd."
      fill_in "farm_city", with: "ourtown"
      fill_in "farm_state", with: "NC"
      fill_in "farm_zip", with: "12345"

      click_button "Add your Farm!"

      expect(page).to have_content("Farm added!")
      expect(page).to have_content("Happy Farm")
    end

    scenario "User registered as farmer fills out form incorrectly" do
      @farm = FactoryGirl.create(:farm)
      visit root_path
      click_link "List My Farm"
      fill_in "farm_name", with: ""
      fill_in "farm_email", with: ""
      fill_in "farm_phone", with: ""
      fill_in "farm_address", with: @farm.address
      fill_in "farm_city", with: @farm.city
      fill_in "farm_state", with: @farm.state
      fill_in "farm_zip", with: @farm.zip

      click_button "Add your Farm!"
      expect(page).to have_content("can't be blank")
    end

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
