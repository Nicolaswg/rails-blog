require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Testing user model' do
		subject {User.new(name: 'testing', post_counter: 0)}
		
		before { subject.save }

		it 'has valid name' do
			expect(subject).to be_valid
		end

		it 'has invalid name' do
			subject.name = nil
			expect(subject).to_not be_valid
		end

		it 'has valid post counter value' do
			expect(subject).to be_valid
		end

		it 'should be invalid if post counter value < 0' do
			subject.post_counter = -2
			expect(subject).to_not be_valid
		end

		it 'should render three most recent post' do
			(1..5).each do	
				Post.create(title: 'Hello', author_id: subject.id, comments_counter: 0, likes_counter: 0)
			end
			expect(subject.most_recent_posts.length).to eq(3)
		end
	end
end
