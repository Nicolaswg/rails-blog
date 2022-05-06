class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_post_comment_counter

	validates_length_of :text, presence: true, in: 2..250
 
	def update_post_comment_counter
    post.increment!(:comments_counter)
  end
end
