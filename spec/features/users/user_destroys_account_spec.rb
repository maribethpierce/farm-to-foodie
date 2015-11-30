require 'rails_helper'

feature 'user deletes account', %{
  As a signed up user
  I want to delete my account
  So that I can leave the site

  Acceptance criteria:
  [] Users can delete account from show page
  [] Users are notified of successful delete
  [] Users are taken back to farms index page
} do

  before(:each) do
    @user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_button 'Log in'

    click_link "Update my Info"
  end

  scenario 'user can delete account' do

    find_button('Delete my account')
  end

  scenario 'user is notified of successful deletion' do
    click_button('Delete my account')

    expect(page).to have_content("Your account has been successfully cancelled")
  end

  scenario 'user is taken to root page after deletion' do
    click_button('Delete my account')

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("#{@user.name}")
  end
end
