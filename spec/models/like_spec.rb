require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Testing like model' do
    it 'likes counter should increase' do
      user = User.new(name: 'test', photo: 'photo-1', bio: 'text-test', post_counter: 0)
      user.save

      post = Post.new(title: 'test-post', text: 'test-text', comments_counter: 0, likes_counter: 0, author_id: user.id)
      post.save

      like = Like.new(author_id: user.id, post_id: post.id)
      like.save

      expect(like.post.likes_counter).to eq(1)
    end
  end
end
