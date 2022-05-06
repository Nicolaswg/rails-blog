class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, class_name: 'Like'
  has_many :comments, class_name: 'Comment'

  after_save :update_post_counter

	validates_length_of :title, presence: true, in: 2..250
	validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0}
	validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
	def update_post_counter
    author.increment!(:post_counter)
  end

  def most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
