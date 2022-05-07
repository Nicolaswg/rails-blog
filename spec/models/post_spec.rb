require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Testing post model' do
    before :all do
      @user = User.new(name: 'Will Smith', post_counter: 0)
      @user.save
    end

    subject do
      Post.new(title: 'Test-title', text: 'Test-text', comments_counter: 1, likes_counter: 0, author_id: @user.id)
    end

    before { subject.save }

    it 'has valid title' do
      expect(subject).to be_valid
    end

    it 'has invalid title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Should not be valid with title length > 250 characters' do
      subject.title = 'f' * 251
      expect(subject).to_not be_valid
    end

    it 'has valid comments_counter' do
      value = subject.comments_counter
      expect(value).to be >= 0
    end

    it 'should be invalid if commenst_counter value < 0' do
      subject.comments_counter = -2
      expect(subject).to_not be_valid
    end

    it 'has valid comments_counter' do
      value = subject.likes_counter
      expect(value).to be >= 0
    end

    it 'should be invalid if commenst_counter value < 0' do
      subject.likes_counter = -2
      expect(subject).to_not be_valid
    end

    it 'should increase posts_counter by 1' do
      expect(subject.author.post_counter).to eq(1)
    end

    it 'should return 5 most recent comments' do
      (1..10).each do
        Comment.create(text: 'test-text', author_id: @user.id, post_id: subject.id)
      end
      expect(subject.most_recent_comments.length).to eq(5)
    end
  end
end
