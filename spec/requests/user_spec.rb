require 'rails_helper'

RSpec.describe 'UserController', type: :request do
  describe 'GET UserController response' do
    it 'Test root path' do
      get '/'
      expect('/').to eq(root_path)
    end

    it 'render root website' do
      get '/'
      expect(response).to render_template(:index)
    end

    it 'success response for :index' do
      get '/user'
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
    end

    it 'success response for :show' do
      get '/user/1'
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
    end
  end
end
