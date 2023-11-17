class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :update_post_likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_likes_counter

  private

  def update_post_likes_counter
    post.increment!(:likes_counter)
  end
end
