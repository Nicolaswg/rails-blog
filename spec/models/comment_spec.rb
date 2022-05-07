require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Testing comment model' do
    it 'comments counter should increase' do
      user = User.new(name: 'test', photo: 'photo-1', bio: 'text-test', post_counter: 0)
      user.save

      post = Post.new(title: 'test-post', text: 'test-text', comments_counter: 0, likes_counter: 0, author_id: user.id)
      post.save

      comment = Comment.new(author_id: user.id, post_id: post.id, text: 'comment-text')
      comment.save

      expect(comment.post.comments_counter).to eq(1)
    end
  end
end
