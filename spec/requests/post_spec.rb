require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET PostController response' do
    it 'success response for :index' do
      get '/user/1/post'
      expect(response).to have_http_status(:ok)
    end

    it 'render Post :index template' do
      get '/user/1/post'
      expect(response).to render_template(:index)
    end

    it 'succes response for :show' do
      get '/user/1/post/1'
      expect(response).to have_http_status(:ok)
    end

    it 'render Post :show template' do
      get '/user/1/post/1'
      expect(response).to render_template(:show)
    end

    it 'check :index placeholder' do
      get '/user/1/post'
      expect(response.body).to include('See all user Post')
    end

    it 'check :show placeholder' do
      get '/user/1/post/1'
      expect(response.body).to include('Show current Post')
    end
  end
end
