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
  end
end
