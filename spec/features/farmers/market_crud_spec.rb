require 'rails_helper'

feature 'farmer can add, edit and delete market info', %{
  As a signed up user (with a farm)
  I want to be add, edit and delete my markets
  so that I can correct and remove my details

  Acceptance Criteria
  [] - As a farmer, I can see the form to add a market
  [] - As a farmer, I can fill out the form and save my market details
  [] - I get error messages if I fill out the form incorrectly
  [] - I can delete my market
} do

  feature "User can add, edit and delete a market" do

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

    scenario "Farmer can navigate to the form to add a market" do
      visit root_path
      click_link "My Farm"
      click_button "Add Market"

      expect(page).to have_content("Market Days:")
    end

    scenario "Farmer can add a market" do
      visit root_path
      click_link "My Farm"
      click_button "Add Market"
      fill_in "market_day_of_week", with: "Tuesday"
      fill_in "market_location", with: "Backstreet Market"
      fill_in "market_address", with: "1232343456"
      fill_in "market_city", with: "ourtown"
      fill_in "market_state", with: "NC"
      fill_in "market_zip", with: "12345"

      click_button "Add Market"

      expect(page).to have_content("Market added!")
      expect(page).to have_content("Tuesday")
      expect(page).to have_content("Backstreet Market")
    end

    scenario "Farmer fills out market form incorrectly" do
      visit root_path
      click_link "My Farm"
      click_button "Add Market"
      fill_in "market_day_of_week", with: ""
      fill_in "market_location", with: ""
      fill_in "market_address", with: ""
      fill_in "market_city", with: "ourtown"
      fill_in "market_state", with: "NC"
      fill_in "market_zip", with: "12345"

      click_button "Add Market"

      expect(page).to have_content("Please fill in all blanks.")
    end

    scenario "Farmer can delete their market listing" do
      visit root_path
      click_link "My Farm"

      expect(page).to have_content("Delete Farm")
    end

    scenario "User registered as farmer can delete their farm listing" do
      visit root_path
      click_link "My Farm"
      click_button "Add Market"
      fill_in "market_day_of_week", with: "Tuesday"
      fill_in "market_location", with: "Backstreet Market"
      fill_in "market_address", with: "1232343456"
      fill_in "market_city", with: "ourtown"
      fill_in "market_state", with: "NC"
      fill_in "market_zip", with: "12345"

      click_button "Add Market"
      click_button "My Markets"
      expect(page).to have_content("Delete Market")
    end

    scenario "User registered as farmer can delete their farm listing" do
      visit root_path
      click_link "My Farm"
      click_button "Add Market"
      fill_in "market_day_of_week", with: "Tuesday"
      fill_in "market_location", with: "Backstreet Market"
      fill_in "market_address", with: "1232343456"
      fill_in "market_city", with: "ourtown"
      fill_in "market_state", with: "NC"
      fill_in "market_zip", with: "12345"

      click_button "Add Market"
      click_button "My Markets"
      click_button "Delete Market"

      expect(page).to have_content("Market Deleted!")
      expect(page).to_not have_content("Tuesday")
      expect(page).to_not have_content("Backstreet Market")

  end

  scenario "User registered as farmer can delete their farm listing" do
    visit root_path
    click_link "My Farm"
    click_button "Add Market"
    fill_in "market_day_of_week", with: "Tuesday"
    fill_in "market_location", with: "Backstreet Market"
    fill_in "market_address", with: "1232343456"
    fill_in "market_city", with: "ourtown"
    fill_in "market_state", with: "NC"
    fill_in "market_zip", with: "12345"

    click_button "Add Market"
    click_button "My Markets"
    click_button "Edit This Market"

    expect(page).to have_content("Update Your Market Information!")
  end
end
end
