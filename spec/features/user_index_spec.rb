require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'User management', type: :feature do
  before do
    FactoryBot.create(:user, name: 'Example User 1')
    FactoryBot.create(:user, name: 'Example User 2')
  end

  describe 'User index page' do
    it 'displays username, profile pictures, and post counts for all users' do
      visit users_path
      # Test that the username, profile pictures, and post counts are displayed for each user
      expect(page).to have_css('.user-username', count: User.count, visible: :visible)
      expect(page).to have_css('.user-profile-picture', count: User.count, visible: :visible)
      expect(page).to have_css('.user-post-count', count: User.count)

      # Test clicking on a user redirects to their show page
      first_user = User.first

      # Find the link associated with the first user's name and click it
      find(".user-item[data-user-id='#{first_user.id}'] a").click

      # Asserting the redirection to the user's show page
      expect(page).to have_current_path(user_path(first_user))
    end
  end
end
