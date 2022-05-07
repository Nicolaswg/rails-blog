class LikeController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    user = current_user
    like = Like.new(author_id: user.id, post_id: post.id)
    flash[:success] = 'Like added' if like.save
    redirect_to "/user/#{post.author.id}/post/#{post.id}" if like.save
  end
end
