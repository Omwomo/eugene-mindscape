require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is valid with valid attributes' do
    comment = build(:comment)
    expect(comment).not_to be_valid
  end

  it 'is not valid without a user_id' do
    comment = build(:comment, user_id: nil)
    expect(comment).not_to be_valid
  end

  it 'is not valid without a post_id' do
    comment = build(:comment, post_id: nil)
    expect(comment).not_to be_valid
  end

  it 'is not valid without text' do
    comment = build(:comment, text: nil)
    expect(comment).not_to be_valid
  end

  describe 'update_post_comments_counter' do
    let(:post) { create(:post) }

    it 'increments comments_counter on creating a comment' do
      expect {
        create(:comment, post: post)
        post.reload
      }.to change { post.comments_counter }.by(1)
    end
  end
end
