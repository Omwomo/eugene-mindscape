class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :text, presence: true

  after_save :update_author_posts_counter

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  private

  def update_author_posts_counter
    author.update_user_posts_counter
  end
end
