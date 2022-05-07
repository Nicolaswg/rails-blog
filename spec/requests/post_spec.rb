require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
	before :all do
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
		@user = User.create(id:1, name: 'test', photo: 'photo-1', bio: 'text-test', post_counter: 0)
		@post = Post.create(id:1, author_id: @user.id, title: 'Post title', text: 'Some text', likes_counter: 0, comments_counter: 0)
  end
	
  describe 'GET PostController response' do
    it 'success response for :index' do
      get "/user/#{@user.id}/post"
      expect(response).to have_http_status(:ok)
    end

    it 'render Post :index template' do
      get "/user/#{@user.id}/post"
      expect(response).to render_template(:index)
    end

    it 'succes response for :show' do
      get "/user/#{@user.id}/post/#{@post.id}"
      expect(response).to have_http_status(:ok)
    end

    it 'render Post :show template' do
      get "/user/#{@user.id}/post/#{@post.id}"
      expect(response).to render_template(:show)
    end
  end
end
