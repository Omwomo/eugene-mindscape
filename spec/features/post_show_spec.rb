RSpec.describe 'Post show page', type: :feature do
    before do
      @user = FactoryBot.create(:user, name: 'Example User')
      @post = FactoryBot.create(:post, author: @user)
      FactoryBot.create_list(:comment, 5, post: @post, user: @user)
    end
  
    it 'displays various post details' do
      visit user_post_path(@user, @post)
  
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@user.name)
      expect(page).to have_content("Comments: #{Comment.where(post: @post).count}")
      expect(page).to have_content("Likes: #{Like.where(post: @post).count}")
      expect(page).to have_content(@post.text)
  
      # Test for displaying comments
      @post.comments.each do |comment|
        expect(page).to have_content(comment.user.name)
        expect(page).to have_content(comment.text)
      end
    end
  end