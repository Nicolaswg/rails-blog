class PostController < ApplicationController
	
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

	def new 
		@post = Post.new
		respond_to do |format|
			format.html {render :new}
		end
	end

	def create
		@user = User.find(params(:user_id))
		respond_to do |format|
			format.html do
				values = params.require(:post).permit(:title, :text)
				post = Post.new(title: values[:title], text: values[:text])
				post.author_id = current_user.id
				if post.save
					redirect_to "/user/#{post.author_id}/post/#{post.id}"
				end
			end
		end
	end
end
