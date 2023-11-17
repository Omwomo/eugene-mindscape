require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is valid with valid attributes' do
    like = build(:like)
    expect(like).not_to be_valid
  end

  it 'is not valid without a user_id' do
    like = build(:like, user_id: nil)
    expect(like).not_to be_valid
  end

  it 'is not valid without a post_id' do
    like = build(:like, post_id: nil)
    expect(like).not_to be_valid
  end

  describe 'update_post_likes_counter' do
    let(:post) { create(:post) }

    it 'increments likes_counter on creating a like' do
      expect {
        create(:like, post: post)
        post.reload
      }.to change { post.likes_counter }.by(1)
    end
  end
end
