RSpec.describe 'User post index page', type: :feature do
  before do
    @user = FactoryBot.create(:user, name: 'Example User 3')
    FactoryBot.create_list(:post, 10, author: @user)
  end

  it 'displays various user post details' do
    visit user_posts_path(@user)

    # Test for user profile details
    expect(page).to have_css('[alt="picture of user"]')
    expect(page).to have_content(@user.name)
    expect(page).to have_content('Number of posts:')
    expect(page).to have_content(@user.posts_counter)

    # Test for displaying posts details
    @user.posts.each do |post|
      expect(page).to have_link(post.title, href: user_post_path(@user, post))
      expect(page).to have_content(post.text.truncate(100))
      expect(page).to have_content(post.comments.first.text) if post.comments.any?
      expect(page).to have_content("Comments: #{post.comments_counter}")
      expect(page).to have_content("Likes: #{post.likes_counter}")
    end

    # Test for pagination
    expect(page).to have_css('.pagination')
  end

  it 'redirects to post show page when a post is clicked' do
    visit user_posts_path(@user)

    first_post = @user.posts.first
    # click_link(first_post.title)
    find(".post-item[data-post-id='#{first_post.id}'] a").click

    expect(page).to have_current_path(user_post_path(@user, first_post))
  end
end
