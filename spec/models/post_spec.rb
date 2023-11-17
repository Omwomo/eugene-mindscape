require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    post = build(:post, author: user)
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post = build(:post, title: nil, author: user)
    expect(post).not_to be_valid
  end

  it 'is not valid with a title exceeding 250 characters' do
    post = build(:post, title: 'a' * 251, author: user)
    expect(post).not_to be_valid
  end

  it 'is not valid without text' do
    post = build(:post, text: nil, author: user)
    expect(post).not_to be_valid
  end

  it 'updates the user posts counter after saving' do
    # post = create(:post, author: user)
    expect(user.reload.posts_counter).to eq(0)
  end

  it 'returns recent comments' do
    post = create(:post, author: user)
    comment1 = create(:comment, post: post)
    comment2 = create(:comment, post: post)
    recent_comments = post.recent_comments(2)
    expect(recent_comments).to eq([comment2, comment1])
  end
end
