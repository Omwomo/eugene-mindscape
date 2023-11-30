require 'rails_helper'
require 'capybara/rspec'
# require_relative '../factories/users'

RSpec.describe 'User management', type: :feature do
  before do
    @user = FactoryBot.create(:user, name: 'Example User', id: 2)
    FactoryBot.create(:post, title: 'Hello', id: 1, author: @user)
  end

  describe 'User show page' do
    it 'displays user profile details, recent posts, and a button to view all posts' do
      visit user_path(@user)

      # Test for user profile details
      expect(page).to have_css('.user-profile', text: @user.name)
      expect(page).to have_css('.user-profile img[alt="picture of user"]')
      expect(page).to have_content('Posts Counter:')
      expect(page).to have_content(@user.bio)

      # Test for recent posts
      @user.recent_posts.each_with_index do |post, index|
        expect(page).to have_content("Post ##{index + 1}")
        expect(page).to have_link(post.title, href: user_post_path(@user, post))
        expect(page).to have_content("Comments: #{post.comments_counter}, Likes: #{post.likes_counter}")
      end

      # Test clicking to see all posts redirects to the user's post index page
      click_link('See all Posts')
      expect(page).to have_current_path(user_posts_path(@user))

      # Test user's post title redirects to the post's show page
      first_post = Post.first

      post_path = user_post_path(@user, first_post)

      expect(page).to have_link(first_post.title, href: post_path)

      # Test clicking a user's post title redirects to the post's show page
      click_link(first_post.title)
      expect(page).to have_current_path(post_path)
    end
  end
end
