class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true
  validates :post_id, presence: true

  after_save :update_post_likes_counter

  private

  def update_post_likes_counter
    return unless post.present?

    post.increment!(:likes_counter)
  end
end
