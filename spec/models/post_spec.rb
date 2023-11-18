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
    user = create(:user)

    expect do
      create(:post, author: user)
    end.to change { user.reload.posts_counter }.by(1)
  end

  it 'returns recent comments' do
    post = create(:post, author: user)
    comment1 = create(:comment, post: post)
    comment2 = create(:comment, post: post)
    recent_comments = post.recent_comments(2)
    expect(recent_comments).to eq([comment2, comment1])
  end

  it 'ensures CommentsCounter is an integer greater than or equal to zero' do
    post = build(:post, comments_counter: 'not_an_integer', author: user)
    expect(post).not_to be_valid
    expect(post.errors[:comments_counter]).to include('is not a number')

    post.comments_counter = -1
    expect(post).not_to be_valid
    expect(post.errors[:comments_counter]).to include('must be greater than or equal to 0')

    post.comments_counter = 0
    expect(post).to be_valid
  end
end
