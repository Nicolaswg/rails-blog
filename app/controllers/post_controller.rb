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
      format.html { render :new }
    end
  end

  def create
    respond_to do |format|
      format.html do
        values = params.require(:post).permit(:title, :text)
        post = Post.new(title: values[:title], text: values[:text])
        post.author_id = current_user.id
				post.comments_counter = 0
				post.likes_counter = 0
        if post.save
					redirect_to "/user/#{post.author_id}/post/#{post.id}"
					flash[:success] = "Post added correctly"
				else
					redirect_to "/user/#{post.author_id}/post/new"
					flash[:error] = "Error! Post wasn't added"
      	end
    	end
  	end
	end
end
