class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :posts, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  # validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end

  def update_user_posts_counter
    update(posts_counter: posts.count)
  end
end
