class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :text, presence: true

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  def update_user_posts_counter
    user.update(posts_counter: user.posts.count)
  end
end
