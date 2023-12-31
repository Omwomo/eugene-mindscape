RSpec.describe User, type: :model do
  it 'is valid with a name' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = build(:user, name: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid with negative posts counter' do
    user = build(:user, posts_counter: -1)
    expect(user).not_to be_valid
  end

  describe '#recent_posts' do
    it 'returns recent posts with default limit' do
      user = create(:user)
      post1 = create(:post, author: user)
      post2 = create(:post, author: user)
      post3 = create(:post, author: user)

      recent_posts = user.recent_posts

      expect(recent_posts).to eq([post3, post2, post1])
    end

    it 'returns recent posts with specified limit' do
      user = create(:user)
      post2 = create(:post, author: user)
      post3 = create(:post, author: user)

      recent_posts = user.recent_posts(2)

      expect(recent_posts).to eq([post3, post2])
    end
  end

  describe '#update_user_posts_counter' do
    it 'updates posts_counter with the count of posts' do
      user = create(:user)
      create_list(:post, 3, author: user)

      user.update_user_posts_counter

      expect(user.reload.posts_counter).to eq(3)
    end
  end
end
