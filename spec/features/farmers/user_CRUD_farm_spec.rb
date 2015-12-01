require 'rails_helper'

feature 'farmer can edit and delete their farm', %{
  As a signed up user (with a farm)
  I want to be edit and delete my farm
  so that I can correct and remove my details

  Acceptance Criteria
  [] - As a farmer, I can see the form to edit details re: my farm
  [] - As a farmer, I can fill out the form and save my details
  [] - I get error messages if I fill out the form incorrectly
  [] - I can delete my farm
} do

  feature "User can access the form to edit their farm" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @farm = FactoryGirl.create(:farm, user: @user)
      visit new_user_session_path

      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password

      click_button 'Log in'
      click_link('Update my Info')

      check('user_farmer')
      fill_in 'user_current_password', with: @user.password
      click_button('Update')
    end

    scenario "Farmer can edit their farm listing" do
      visit root_path
      click_link "My Farm"
      click_button "Update Information"

      expect(page).to have_content("Update your farm information!")
    end

    scenario "Farmer can edit their farm listing" do
      visit root_path
      click_link "My Farm"
      click_button "Update Information"
      fill_in "farm_name", with: "Sad Farm"
      fill_in "farm_email", with: "sad@farm.com"
      fill_in "farm_phone", with: "1232343456"
      fill_in "farm_address", with: "234 School Rd."
      fill_in "farm_city", with: "ourtown"
      fill_in "farm_state", with: "NC"
      fill_in "farm_zip", with: "12345"

      click_button "Update your Farm!"

      expect(page).to have_content("Farm updated!")
      expect(page).to have_content("Sad Farm")
    end

    scenario "User registered as farmer fills out form incorrectly" do
      visit root_path
      click_link "My Farm"
      click_button "Update Information"
      fill_in "farm_name", with: ""
      fill_in "farm_email", with: ""
      fill_in "farm_phone", with: ""
      fill_in "farm_address", with: "234 School Rd."
      fill_in "farm_city", with: "ourtown"
      fill_in "farm_state", with: "NC"
      fill_in "farm_zip", with: "12345"

      click_button "Update your Farm!"
      expect(page).to have_content("can't be blank")
    end

  end
end
