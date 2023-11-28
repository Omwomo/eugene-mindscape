require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  before(:each) do
    # Assuming you have some users created for testing purposes
    @users = FactoryBot.create_list(:user, 3) # Use FactoryBot or create users here
    visit users_path
  end

  scenario 'Viewing user index page' do
    # Check if the page displays the username, profile picture, and number of posts for each user
    @users.each do |user|
      expect(page).to have_content(user.name)
      expect(page).to have_css("img[src*='#{user.photo}']")
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
    end
  end

  scenario 'Clicking on a user redirects to their show page' do
    # Click on each user's link and check if it redirects to their show page
    @users.each do |user|
      click_link user.name
      expect(page).to have_current_path(user_path(user))
      visit users_path # Return to the index page for the next iteration
    end
  end
end
