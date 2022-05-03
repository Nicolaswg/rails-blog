class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, class_name: 'Like'
  has_many :comments, class_name: 'Comment'

	def most_recent_comments
		comments.limit(5).order(created_at: :desc)
	end
end
