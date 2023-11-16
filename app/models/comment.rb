class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :text, presence: true

  after_create :update_post_comments_counter

  private

  def update_post_comments_counter
    post.increment!(:comments_counter)
  end
end
